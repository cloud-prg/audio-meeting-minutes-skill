#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  transcribe_audio.sh AUDIO_PATH [--language zh] [--model small] [--output-dir outputs/audio-meeting-minutes]

Creates:
  <output-dir>/<audio-stem>_raw.txt

Requires:
  whisperkit-cli
USAGE
}

if [[ $# -eq 1 && ( "$1" == "-h" || "$1" == "--help" ) ]]; then
  usage
  exit 0
fi

if [[ $# -lt 1 ]]; then
  usage
  exit 2
fi

audio_path="$1"
shift

language="zh"
model="small"
output_dir="outputs/audio-meeting-minutes"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --language)
      language="${2:-}"
      shift 2
      ;;
    --model)
      model="${2:-}"
      shift 2
      ;;
    --output-dir)
      output_dir="${2:-}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

if [[ ! -f "$audio_path" ]]; then
  echo "Audio file not found: $audio_path" >&2
  exit 1
fi

if ! command -v whisperkit-cli >/dev/null 2>&1; then
  echo "whisperkit-cli is required but was not found." >&2
  exit 127
fi

mkdir -p "$output_dir"

filename="$(basename "$audio_path")"
stem="${filename%.*}"
raw_path="$output_dir/${stem}_raw.txt"
meta_path="$output_dir/${stem}_meta.txt"

{
  echo "Source: $audio_path"
  echo "Tool: whisperkit-cli"
  echo "Model: $model"
  echo "Language: $language"
  echo "Generated: $(date '+%Y-%m-%d %H:%M:%S %Z')"
  echo
} > "$meta_path"

whisperkit-cli transcribe \
  --audio-path "$audio_path" \
  --model "$model" \
  --language "$language" \
  --without-timestamps > "$raw_path"

echo "$raw_path"
