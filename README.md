# copilot-ux-design

> **Part of [sdd-vscode-agents](https://github.com/SufficientDaikon/sdd-vscode-agents)** — install the full collection for the complete SDD pipeline + UI/UX lifecycle.

A VS Code Copilot agent plugin that defines interaction patterns, component states, transitions, form UX, and accessibility requirements.

## What it does

The **ux-design** agent creates UX specifications:
- Defines micro-interactions and transition specifications
- Maps all component states (default, hover, active, disabled, error, loading)
- Specifies form UX with validation, error messages, and recovery flows
- Documents accessibility requirements (keyboard navigation, screen readers, ARIA)
- Creates animation specifications with timing and easing

## Hooks included

| Hook | Event | What it does |
|------|-------|-------------|
| **Input detection** | `SessionStart` | Auto-detects wireframes/ and information-architecture.md for UX design input |
| **UX spec completion** | `Stop` | Checks for ux-spec.md and suggests next step (UI design or design review) |

## Install

### Via Copilot CLI
```bash
copilot plugin install SufficientDaikon/copilot-ux-design
```

### Via VS Code settings

Clone the repo and add to your `settings.json`:
```json
"chat.plugins.paths": {
    "/path/to/copilot-ux-design": true
}
```

### Via local path
```bash
git clone https://github.com/SufficientDaikon/copilot-ux-design.git
copilot plugin install ./copilot-ux-design
```

## Usage

Switch to the **ux-design** agent in VS Code chat, then:
```
Create the UX specification based on wireframes and IA document
```
**Expected output**: A comprehensive ux-spec.md with interactions, states, animations, and accessibility specs.

## Pipeline position

```
wireframe -> **ux-design** -> ui-design
```

## Full collection

This agent works best as part of the full SDD + UI/UX pipeline. Install all 13 agents:

```bash
copilot plugin install SufficientDaikon/sdd-vscode-agents
```

See the [full collection](https://github.com/SufficientDaikon/sdd-vscode-agents) for documentation and the complete agent list.

## License

MIT
