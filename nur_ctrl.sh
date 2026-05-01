#!/bin/bash

# --- KONFIGURASI DURASI (DALAM DETIK) ---
declare -A DURASI
DURASI["NurMaster"]=$((6 * 3600))
DURASI["qwen2:0.5b"]=$((8 * 3600))
DURASI["admin_keuangan"]=$((10 * 3600))
DURASI["AI_IndramayuClub"]=$((18 * 3600))
DURASI["piramida_guard"]=$((14 * 3600))
DURASI["Ai_kesatria:latest"]=$((16 * 3600))
DURASI["indramayuClub"]=$((12 * 3600))
DURASI["Nur_ai_mubin"]=$((20 * 3600))
DURASI["hacker_makrifat"]=$((22 * 3600))
DURASI["qwen2.5-coder:0.5b"]=$((24 * 3600))

start_model() {
    MODEL=$1
    if [ -n "${DURASI[$MODEL]}" ]; then
        echo "Menyalakan $MODEL selama ${DURASI[$MODEL]} detik..."
        ollama run $MODEL & 
        sleep ${DURASI[$MODEL]} && pkill -f "ollama run $MODEL" &
    else
        echo "Model tidak dikenal."
    fi
}

case $1 in
    "start") start_model $2 ;;
    "stopall") pkill -f "ollama run"; echo "Semua Agen Istirahat." ;;
    "status") ollama list ;;
    *) echo "Gunakan: ./nur_ctrl.sh start [nama_model]" ;;
esac

