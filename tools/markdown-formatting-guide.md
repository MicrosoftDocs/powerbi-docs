# Markdown Formatting Standards for Power BI Docs

## Critical Formatting Requirements

When updating documentation during freshness reviews, ensure all markdown follows these **exact** standards:

### 1. Date Formatting
```yaml
# CORRECT - Use forward slashes in MM/DD/YYYY format
ms.date: 11/10/2025

# INCORRECT - Don't use dashes, dots, or other formats  
ms.date: 2025-11-10  ❌
ms.date: 11.10.2025  ❌
```

### 2. Text Emphasis

```markdown
# CORRECT - Use asterisks for bold and italic
**This text is bold**
*This text is italic*
**Bold with *italic* inside**

# INCORRECT - Don't use underscores
__This text is bold__     ❌
_This text is italic_     ❌
```

### 3. Lists

#### Bullet Lists
```markdown
# CORRECT - Use dashes for bullet points
- First item
- Second item  
- Third item

# INCORRECT - Don't use asterisks or plus signs
* First item     ❌
+ First item     ❌
```

#### Numbered Lists  
```markdown
# CORRECT - Use "1." for ALL numbered items (auto-numbering)
1. First step
1. Second step
1. Third step

# INCORRECT - Don't manually number items
1. First step     ❌
2. Second step    ❌
3. Third step     ❌
```

### 4. Code Blocks
```markdown
# CORRECT - Specify language for syntax highlighting
```yaml
ms.date: 11/10/2025
```

```powershell
Get-Process | Where-Object CPU -gt 100
```

# INCORRECT - Don't leave language unspecified
```
some code here    ❌
```
```

## Quality Checklist

Before submitting changes, verify:

- [ ] All **bold** text uses `**asterisks**` 
- [ ] All *italic* text uses `*single asterisks*`
- [ ] All bullet lists use `-` dashes
- [ ] All numbered lists use `1.` for every item
- [ ] ms.date follows `MM/DD/YYYY` format with forward slashes
- [ ] Code blocks specify programming language
- [ ] Links are not broken and point to current content
- [ ] Screenshots show current UI (if applicable)

## Common Mistakes to Avoid

1. **Mixed formatting**: Don't mix `**bold**` with `__bold__` in the same document
1. **Manual numbering**: Let markdown handle auto-numbering with `1.`
1. **Wrong date format**: Always use `11/10/2025`, never `2025-11-10`
1. **Inconsistent bullets**: Stick to `-` dashes throughout the document

---

*Reference: Microsoft Learn Content Guidelines*