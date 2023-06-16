# Markdown Academy Conversations

Welcome to the Markdown Academy Conversations repository! This repository is a collection of Markdown documents that describe conversations using the Markdown Academy Conversation Format. It provides a structured way to represent conversations with various formatting options. Feel free to contribute by adding more conversations to this repository. The conversations are stored in the [conversations folder](https://github.com/markdown-academy/conversations/tree/main/conversations) of the repository.

## Markdown Academy Conversation Format

The Markdown Academy Conversation Format is a specific format for Markdown documents that describe conversations. It allows you to structure and represent conversations with various formatting options. The format is designed to be human-readable and can include elements like italic text, bold text, code blocks, quotes, lists, images, links, and more.

### Formatting Options

The following formatting options are supported within the conversation parts:

- *Italic Text*: Wrap the text with asterisks (`*`) to display it in italic format.
- **Bold Text**: Wrap the text with double asterisks (`**`) to display it in bold format.
- `Code Style`: Wrap the text with backticks (`\``) to display it as code style.
- Block Code: Use three backticks (```) to enclose a block of code. The code block can span multiple lines.
- Quotes: Use a greater-than sign (`>`) at the beginning of a line to create a blockquote.
- Ordered Lists: Use numbers followed by a period (`1.`, `2.`, etc.) to create an ordered list.
- Bullet Lists: Use asterisks (`*`) or hyphens (`-`) to create bullet lists.
- Images: Use the Markdown image syntax (`![alt text](image URL)`) to display an image with an external reference.
- External Links: Use the Markdown link syntax (`[link text](URL)`) to create an external link.

### Emoticons

Emoticons can be used within conversation parts, following the Slack/GitHub format, such as `:up:`, `:ok:`, `:cry:`, etc. These will be displayed as the corresponding emoticons in the conversation.

## Document Structure

A Markdown Academy conversation document follows a specific structure. It consists of multiple conversation parts, where each part is represented by a Markdown paragraph. Each conversation part can have an explicit anchor generated from the H2 headline (`## Headline`) preceding the conversation text paragraph. Each conversation part can have associated decisions represented by a group of internal links in a Markdown paragraph immediately following the conversation text paragraph.

```
## Paragraph with Decisions
This part provides decistions

[:ok: Option One](#option-one) [:cry: Option Two](#option-two) [:wave: Quit](_quit)

```

The link can use `_quit` or any link title starting with `!` to exit the conversation completely.

Normally, the conversation follows the original document. However, if you want to navigate the reader to another part of the conversation without user interaction, you can add internal links whose titles start with the `>` sign.


```
## Option One

Option one selected

[> The End](#the-end)

## Option Two

Option two selected

[> The End](#the-end)

## The End

This is the last conversation

```


## Markdown Academy Slack Bot

The Markdown Academy Slack bot allows you to interact with conversations based on the Markdown Academy Conversation Format in your Slack workspace. To install the Slack bot, follow these steps:

1. Visit the installation link: [Markdown Academy Slack Bot Installation](https://api.markdown.academy/slack/install).
2. This link will take you to the installation page for the Markdown Academy Slack bot.
3. Follow the instructions provided on the installation page to authorize the bot for your Slack workspace.
4. Grant the necessary permissions and complete the installation process.
5. Once the installation is complete, the Markdown Academy Slack bot will be available in your Slack workspace.
6. You can start using the bot to have conversations based on the Markdown Academy Conversation Format.
7. The internal links or conversation decisions within the conversations will be transformed into buttons, allowing users to navigate through the conversation and make choices.

If you have any further questions or need assistance with the Slack bot installation, please refer to the documentation or support provided by Markdown Academy.

