# Audio Meeting Minutes Skill

[![skills.sh](https://skills.sh/b/cloud-prg/audio-meeting-minutes-skill)](https://skills.sh/cloud-prg/audio-meeting-minutes-skill)

Codex skill for turning audio or video recordings into cleaned transcripts, front-end interview Q&A notes, and Feishu Minutes-style meeting summaries.

## Install

After this repository is published to GitHub:

```bash
npx skills add cloud-prg/audio-meeting-minutes-skill@audio-meeting-minutes
```

## What it does

- Transcribes local audio with `whisperkit-cli`.
- Cleans raw ASR text using documentation-writing principles.
- Converts front-end interview recordings into `Question 1`, `Question 2`, ... blocks.
- Adds front-end interview evaluation dimensions, including project depth, framework depth, engineering practice, AI tooling, and communication under follow-up.
- Produces concise meeting or interview notes.

## Requirements

- macOS with `whisperkit-cli` installed.
- A local audio or video file readable by the agent.

## Skill

The skill lives in:

```text
audio-meeting-minutes/
```
