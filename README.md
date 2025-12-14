# My Dotfiles

This repository contains my personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).  
It includes configuration for Bash, Git, editors, and other tools I use regularly.

---

## Operating System

- **OS:** Omarchy Linux (Arch-based)
- **Shell:** Bash

---

## Workflow

I use a set of Bash functions to automate managing my dotfiles:

- **`st`** — Show the status of chezmoi-managed files.  
- **`chm`** — List all files managed by chezmoi.  
- **`cadd <path>`** — Add a specific file to chezmoi.  
- **`dfor`** — Forget files that were deleted from the home directory.  
- **`madd`** — Add all modified files in the home directory.  
- **`dp`** — Push all changes in the chezmoi repo to Git.  
- **`dall`** — Full automation: forget deleted files, add modified files, and push everything.

---

## Setup

1. Install chezmoi:  

```bash
sh -c "$(curl -fsLS get.chezmoi.io)"
```


These instructions detail how to initialize your dotfiles repository with Chezmoi and use the provided automation functions.

---

## Installation and Initialization

1.  **Clone the Repository and Apply Initial State**

    Use the following command, replacing `<your-git-repo-url>` with the actual URL of your dotfiles repository:

    ```bash
    chezmoi init --apply <your-git-repo-url>
    ```

2.  **Add Automation Functions**

    The provided automation functions simplify common Chezmoi workflows. Add them to your shell configuration by sourcing the file.

    * **If you use `bash`**, add this line to your `~/.bashrc`:
        ```bash
        source ~/.config/bash/chezmoi_functions.sh
        ```
    * (Adjust the path if your functions file is located elsewhere).

3.  **Reload Your Shell**

    Apply the changes to your current shell session:

    ```bash
    source ~/.bashrc
    ```
    Alternatively, you can start a new shell session.

---

## Usage - Automation Functions

The following functions provide a quicker way to interact with Chezmoi and Git.

| Command | Action/Function Name | Description |
| :--- | :--- | :--- |
| `st` | Status | Runs `chezmoi status`. Shows changes in your home directory that are staged, modified, or untracked relative to your dotfiles repo. |
| `dall` | Daily Sync (All) | A comprehensive command to save and push your changes: <ul><li>Forgets deleted files (`chezmoi forget`).</li><li>Adds modified/untracked files (`chezmoi add`).</li><li>Commits changes (`chezmoi git commit`).</li><li>Pushes to the repository (`chezmoi git push`).</li></ul> |
| `cadd <path>` | Add Individual File | Runs `chezmoi add <path>`. Use this to manually stage a specific modified file for the next commit. |

---
