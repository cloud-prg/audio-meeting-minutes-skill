---
name: audio-meeting-minutes
description: Use when the user asks to convert an audio or video recording into a cleaned transcript, front-end interview recap, Question 1/Question 2 style Q&A notes, Feishu Minutes-style meeting notes, action items, or summaries. Supports local WhisperKit transcription to TXT, then documentation-writer cleanup and frontend-interview-skill evaluation dimensions.
---

# Audio Meeting Minutes

Use this skill to turn an audio/video recording into a usable document:

1. Transcribe media to a raw TXT file.
2. Clean the transcript without inventing content.
3. Extract interview questions and answers into `Question 1`, `Question 2`, ... blocks.
4. Produce notes similar to Feishu Minutes: summary, structured Q&A, key points, risks, and follow-ups.

## Workflow

### 1. Confirm inputs

Identify:

- Source file path.
- Language, if known. Default to `zh` for Chinese recordings.
- Output preference: raw transcript only, cleaned transcript, Q&A transcript, meeting minutes, or all.
- Recording type, if known. For front-end interviews, use the front-end interview recap format.

Do not paste secrets or private credentials. Local audio files are acceptable.

### 2. Transcribe to TXT

Prefer local/free transcription when available:

```bash
bash audio-meeting-minutes/scripts/transcribe_audio.sh "/path/to/audio.m4a" --language zh --model small
```

The script writes files under `./outputs/audio-meeting-minutes/`.

Model guidance:

- `tiny`: fastest, rough draft only.
- `small`: default balance for Chinese interview audio.
- `medium` or `large-v3`: higher quality but slower; use when the first pass is poor or the user asks for accuracy.

If `whisperkit-cli` is missing, tell the user and suggest installing WhisperKit CLI. Do not switch to a paid cloud API unless the user explicitly asks.

### 3. Clean the transcript

Use the `documentation-writer` skill's clarity and consistency principles, but do not follow its approval-gated documentation workflow unless the user is asking for formal docs. For transcript cleanup, proceed directly.

Cleanup rules:

- Preserve meaning. Do not add facts that are not in the transcript.
- Remove filler words, repeated fragments, obvious ASR artifacts, and false starts when they do not change meaning.
- Normalize technical terms conservatively, e.g. `WebRTC`, `FLV.js`, `Video.js`, `OpenSpec`, `React`, `Webpack`, `Vite`, `i18n`, `H.264`, `H.265`.
- Mark uncertain terms as `[疑似: ...]` or `[听不清]` instead of guessing.
- Keep important hedging, uncertainty, objections, and interviewer challenges.

### 4. Extract questions

For interviews, do not format the output as `提问者/回答者`. Extract each major interviewer question or topic switch as a numbered question block:

- Merge small follow-up prompts into the same question when they belong to one topic.
- Start a new question when the interviewer changes topic, e.g. self-introduction, work history, project deep dive, technical design, AI tooling, or career motivation.
- Keep interviewer challenges and corrections in `Follow-ups`.
- If the candidate answer is unclear, preserve uncertainty with `[听不清]` or `[疑似: ...]`.

Format interview Q&A as:

```markdown
## Q&A 清洗稿

### Question 1: <问题标题>

**Question:** <清洗后的问题>

**Answer:** <清洗后的回答>

**Follow-ups:** <追问、质疑或补充问题；没有则写“无”>

**Evaluation:** <对回答质量的简短判断>
```

### 5. Apply front-end interview evaluation

When the recording is a front-end interview, use the `frontend-interview-skill` evaluation dimensions as the analysis lens:

- Project authenticity and depth.
- Front-end fundamentals.
- Framework depth, such as React/Vue state, rendering, hooks, composition, and component design.
- Engineering practice, such as build tools, monitoring, performance, testing, component libraries, and system design.
- AI-assisted engineering or Vibe Coding experience when discussed.
- Communication quality, ownership, trade-off thinking, and ability to handle follow-up pressure.

Do not turn this into a simulated interview. Use these dimensions only to classify questions, evaluate answer depth, and propose follow-up questions.

### 6. Produce Feishu Minutes-style notes

Load `references/minutes-format.md` when creating final notes. Keep the final document concise and scannable.

For interview recordings, include:

- 基本信息
- 一句话结论
- 候选人背景
- 项目与技术要点
- 面试官关注点
- 风险与待追问
- 前端面试维度评分
- 建议后续动作
- `Question 1` / `Question 2` style Q&A 清洗稿

For ordinary meetings, include:

- 会议概览
- 核心结论
- 议题纪要
- 决策
- 待办事项
- 风险/阻塞
- 清洗后的议题纪要

## Output files

Prefer writing outputs beside the working directory under:

```text
outputs/audio-meeting-minutes/
```

Recommended filenames:

- `<stem>_raw.txt`
- `<stem>_cleaned.md`
- `<stem>_qa.md`
- `<stem>_minutes.md`

## Quality checks

Before final response:

- Confirm the source file was readable.
- Confirm the raw TXT exists.
- State which model was used.
- Call out known quality limits, especially ASR uncertainty and inferred question boundaries.
- Provide clickable file links for generated files.
