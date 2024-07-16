---
title: Q&A in Power BI embedded analytics
description: Learn how Power BI embedded analytics offers a way to incorporate Q&A into an application and allow your users to ask questions using natural language.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 02/04/2024
#customer intent: As a developer, I want to learn how to incorporate Q&A into my application using Power BI embedded analytics so I can write more interactive applications.
---

# Q&A in Power BI embedded analytics

Power BI embedded analytics offers you a way to incorporate [Q&A](pbi-glossary.md#qa) into an application. Your users can ask questions using natural language, and receive immediate answers in the form of visuals like charts or graphs.

:::image type="content" source="media/qanda/embedded-qanda.gif" alt-text="Animated GIF of the Power BI Embedded view, which shows how to embed a sample Q&A question.":::

There are two modes for embedding Q&A within your application: **interactive** and **result only**. **Interactive** mode allows you to type in questions and have them displayed within the visual. If you have a saved question, or a set question you want to display, you can use the **result only** mode by populating the question in your embed config.

Here's an example of the JavaScript code:

```javascript
// Embed configuration used to describe the what and how to embed.
// This object is used when calling powerbi.embed within the JavaScript API.
// You can find more information at https://github.com/Microsoft/PowerBI-JavaScript/wiki/Embed-Configuration-Details.
var config= {
    type: 'qna',
    tokenType:   models.TokenType.Embed | models.TokenType.Aad,
    accessToken: access token value,
    embedUrl:    https://app.powerbi.com/qnaEmbed (groupId to be appended as query parameter if required),
    datasetIds:  array of requested data set ids (at the moment we support only one dataset),
    viewMode:    models.QnaMode.Interactive | models.QnaMode.ResultOnly,
    question:    optional parameter for Explore mode (QnaMode.Interactive) and mandatory for Render Result mode (QnaMode.ResultOnly)
};

// Get a reference to the embedded QNA HTML element
var qnaContainer = $('#qnaContainer')[0];

// Embed the QNA and display it within the div container.
var qna = powerbi.embed(qnaContainer, config);
```

## Set question

If you use **result mode** with a set question, you can inject more questions into the frame. The answer to the new question will immediately replace the previous result. A new visual is rendered matching the new question.

One example of this usage would be a frequently asked question list. The user could go through the questions and have them answered within the same embedded part.

**Code snippet for JS SDK usage:**  

```javascript
// Get a reference to the embedded Q&A HTML element
var qnaContainer = $('#qnaContainer')[0];

// Get a reference to the embedded Q&A.
qna = powerbi.get(qnaContainer);

qna.setQuestion("This year sales")
    .then(function (result) {
        …….
    })
    .catch(function (errors) {
        …….
    });
```

## Visual rendered event

For **interactive** mode, the application can be notified with a data changed event each time the rendered visual changes to target the updated input query as it is being typed.

Listening to the *visualRendered* event allows you to save questions for use later.

**Code snippet for JS SDK usage:**  

```javascript
// Get a reference to the embedded Q&A HTML element
var qnaContainer = $('#qnaContainer')[0];

// Get a reference to the embedded Q&A.
qna = powerbi.get(qnaContainer);

// qna.off removes a given event listener if it exists.
qna.off("visualRendered");

// qna.on will add an event listener.
qna.on("visualRendered", function(event) {
     …….
});
```

## Embed token

Create an embed token from a semantic model to start a Q&A part. For more information, see the [generate token operation](/rest/api/power-bi/embedtoken).

## Related content

[Try out Q&A embedding with the JavaScript embed sample](https://microsoft.github.io/PowerBI-JavaScript/demo/)

More questions? [Ask the Power BI Community](https://community.powerbi.com/)
