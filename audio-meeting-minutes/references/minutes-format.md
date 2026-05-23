# Meeting Minutes Format

Use this reference when producing the final cleaned document.

## Interview notes

```markdown
# 前端面试纪要：<候选人/主题>

## 基本信息

- 音频来源：<filename>
- 转写模型：<model>
- 语言：<language>
- 处理说明：机器转写 + 人工规则清洗，专有名词需复核

## 一句话结论

<用 1-2 句话概括候选人背景、强项、主要风险。>

## 候选人背景

- <工作年限、公司、岗位>
- <主要项目>
- <当前状态/求职动机>

## 项目与技术要点

- <项目 1：背景、职责、技术方案、结果>
- <项目 2：背景、职责、技术方案、结果>

## 面试官关注点

- <追问点 1>
- <追问点 2>
- <追问点 3>

## 前端面试维度评分

| 维度 | 评价 | 证据 |
| --- | --- | --- |
| 项目真实性与深度 | <强/中/弱> | <来自回答的证据> |
| 前端基础 | <强/中/弱/未充分考察> | <来自回答的证据> |
| 框架深度 | <强/中/弱/未充分考察> | <React/Vue/状态/渲染等证据> |
| 工程化与系统设计 | <强/中/弱> | <构建、监控、性能、架构等证据> |
| AI 工具与 Vibe Coding | <强/中/弱/未充分考察> | <OpenSpec/Codex/Agent 等证据> |
| 沟通与抗追问 | <强/中/弱> | <表达、澄清、承认边界等证据> |

## 风险与待追问

- <风险或不确定点>
- <建议下一轮继续验证的问题>

## 建议后续动作

- <推进/待定/不推进，以及理由>

## Q&A 清洗稿

### Question 1: <问题标题>

**Question:** <清洗后的问题>

**Answer:** <清洗后的回答>

**Follow-ups:** <追问、质疑或补充问题；没有则写“无”>

**Evaluation:** <回答质量、深度、风险点>
```

## General meeting notes

```markdown
# 会议纪要：<会议主题>

## 会议概览

- 音频来源：<filename>
- 转写模型：<model>
- 参会角色：<已知角色或说话人>

## 核心结论

- <结论 1>
- <结论 2>

## 议题纪要

### <议题 1>

- <讨论内容>
- <重要分歧或原因>

## 决策

- <已确认的决策>

## 待办事项

| 事项 | 负责人 | 截止时间 | 状态 |
| --- | --- | --- | --- |
| <action> | <owner/待确认> | <date/待确认> | 待办 |

## 风险/阻塞

- <风险>

## 议题清洗稿

### Topic 1: <议题标题>

<清洗后的讨论内容>
```

## Cleaning standards

- Prefer short paragraphs over long blocks.
- Keep original order unless summarizing.
- Do not invent owners, deadlines, numbers, or conclusions.
- If a conclusion is inferred, label it as `推断`.
- If a phrase is uncertain, keep `[听不清]` or `[疑似: term]`.
- For interviews, prefer `Question N` blocks over speaker labels.
