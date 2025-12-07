#!/bin/bash

# ================================================================
# Deployment Script for AutoHotkey Shortcuts
# ================================================================
# Author: @aborruso
# Description: Copies the main AutoHotkey script to deployment directory
# Usage: ./deploy.sh [--help] [--verbose]
# ================================================================

# Configurazione
SOURCE_FILE="start@aborruso.ahk"
EXE_FILE="start@aborruso.exe"
TARGET_DIR="/mnt/c/github/shortcuts-kwh"
VERBOSE=false
COMPILE_EXE=false
SKIP_BACKUP=true

# Colori per output (se supportati)
if [[ -t 1 ]]; then
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    NC='\033[0m' # No Color
else
    RED=''
    GREEN=''
    YELLOW=''
    NC=''
fi

# Funzione per mostrare aiuto
show_help() {
    echo "Script di deploy per AutoHotkey Shortcuts"
    echo ""
    echo "Uso: $0 [opzioni]"
    echo ""
    echo "Opzioni:"
    echo "  --help, -h     Mostra questo aiuto"
    echo "  --verbose, -v  Output dettagliato"
    echo "  --compile, -c  Compila anche l'eseguibile .exe"
    echo ""
    echo "Descrizione:"
    echo "  Copia '$SOURCE_FILE' nella directory di deploy '$TARGET_DIR'"
    echo "  con gestione degli errori e feedback sull'operazione."
    echo "  Con --compile compila anche l'eseguibile Windows."
}

# Funzione per output verbale
verbose_echo() {
    if [[ "$VERBOSE" == true ]]; then
        echo -e "${YELLOW}[VERBOSE]${NC} $1"
    fi
}

# Funzione per output di successo
success_echo() {
    echo -e "${GREEN}[SUCCESSO]${NC} $1"
}

# Funzione per output di errore
error_echo() {
    echo -e "${RED}[ERRORE]${NC} $1" >&2
}

# Funzione per verificare integrità file
verify_file_integrity() {
    local source="$1"
    local target="$2"
    
    verbose_echo "Verifica integrità file..."
    
    # Confronta dimensioni
    local source_size=$(stat -c%s "$source" 2>/dev/null || echo "0")
    local target_size=$(stat -c%s "$target" 2>/dev/null || echo "0")
    
    if [[ "$source_size" -eq "$target_size" ]]; then
        verbose_echo "Dimensioni file corrispondenti: $source_size bytes"
        return 0
    else
        error_echo "Dimensioni file non corrispondenti: source=$source_size, target=$target_size"
        return 1
    fi
}

# Parsing argomenti
while [[ $# -gt 0 ]]; do
    case $1 in
        --help|-h)
            show_help
            exit 0
            ;;
        --verbose|-v)
            VERBOSE=true
            shift
            ;;
        --compile|-c)
            COMPILE_EXE=true
            shift
            ;;
        *)
            error_echo "Opzione non riconosciuta: $1"
            echo "Usa --help per le opzioni disponibili."
            exit 1
            ;;
    esac
done

# Inizio operazioni
verbose_echo "Inizio deploy di '$SOURCE_FILE' verso '$TARGET_DIR'"

# 1. Verifica file sorgente
verbose_echo "Verifica file sorgente..."
if [[ ! -f "$SOURCE_FILE" ]]; then
    error_echo "File sorgente non trovato: '$SOURCE_FILE'"
    error_echo "Assicurati di eseguire lo script dalla directory radice del progetto."
    exit 1
fi

verbose_echo "File sorgente trovato: $(realpath "$SOURCE_FILE")"

# 2. Verifica directory target
verbose_echo "Verifica directory target..."
if [[ ! -d "$TARGET_DIR" ]]; then
    error_echo "Directory target non trovata: '$TARGET_DIR'"
    error_echo "Verifica che il percorso sia corretto e accessibile."
    exit 1
fi

if [[ ! -w "$TARGET_DIR" ]]; then
    error_echo "Directory target non scrivibile: '$TARGET_DIR'"
    error_echo "Verifica i permessi di scrittura."
    exit 1
fi

verbose_echo "Directory target verificata: $TARGET_DIR"

# 3. Backup file esistente (se presente e non disabilitato)
TARGET_FILE="$TARGET_DIR/$SOURCE_FILE"
if [[ "$SKIP_BACKUP" == false ]] && [[ -f "$TARGET_FILE" ]]; then
    BACKUP_FILE="${TARGET_FILE}.backup.$(date +%Y%m%d_%H%M%S)"
    verbose_echo "File target esistente, creo backup: $BACKUP_FILE"
    
    if cp "$TARGET_FILE" "$BACKUP_FILE"; then
        verbose_echo "Backup creato con successo"
    else
        error_echo "Impossibile creare backup del file esistente"
        exit 1
    fi
else
    verbose_echo "Backup disabilitato (file gestito da git)"
fi

# 4. Operazione di copia
verbose_echo "Copia file in corso..."
if cp "$SOURCE_FILE" "$TARGET_DIR/"; then
    success_echo "File copiato con successo"
    verbose_echo "Source: $(realpath "$SOURCE_FILE")"
    verbose_echo "Target: $TARGET_FILE"
else
    error_echo "Copia fallita"
    error_echo "Verifica spazio su disco e permessi."
    exit 1
fi

# 5. Verifica integrità
if verify_file_integrity "$SOURCE_FILE" "$TARGET_FILE"; then
    success_echo "Deploy script completato con successo!"
    echo "File deployato: $TARGET_FILE"
    
    # Mostra info aggiuntive in modalità verbose
    if [[ "$VERBOSE" == true ]]; then
        echo ""
        echo "Dettagli file:"
        stat -c "  Dimensione: %s bytes" "$TARGET_FILE"
        stat -c "  Modificato: %y" "$TARGET_FILE"
        stat -c "  Permessi: %A" "$TARGET_FILE"
    fi
else
    error_echo "Verifica integrità fallita dopo la copia"
    exit 1
fi

# 6. Compilazione eseguibile (se richiesto)
if [[ "$COMPILE_EXE" == true ]]; then
    verbose_echo "Inizio compilazione eseguibile..."
    
    # Verifica che compile.bat esista nella directory target
    if [[ ! -f "$TARGET_DIR/compile.bat" ]]; then
        error_echo "File compile.bat non trovato in $TARGET_DIR"
        exit 1
    fi
    
    # Converti path WSL in path Windows
    WIN_TARGET_DIR=$(wslpath -w "$TARGET_DIR")
    verbose_echo "Directory Windows: $WIN_TARGET_DIR"
    
    # Esegui compilazione in ambiente Windows dalla directory corretta
    verbose_echo "Eseguo compile.bat..."
    if (cd "$TARGET_DIR" && cmd.exe /c compile.bat); then
        success_echo "Compilazione completata!"
        
        # L'eseguibile è già nella directory target, verifica solo che esista
        EXE_TARGET="$TARGET_DIR/$EXE_FILE"
        if [[ -f "$EXE_TARGET" ]]; then
            success_echo "Eseguibile creato: $EXE_TARGET"
            
            if [[ "$VERBOSE" == true ]]; then
                echo ""
                echo "Dettagli eseguibile:"
                stat -c "  Dimensione: %s bytes" "$EXE_TARGET"
                stat -c "  Modificato: %y" "$EXE_TARGET"
            fi
        else
            error_echo "Eseguibile non trovato dopo compilazione"
            exit 1
        fi
    else
        error_echo "Compilazione fallita"
        exit 1
    fi
fi

success_echo "Deploy completato!"
exit 0