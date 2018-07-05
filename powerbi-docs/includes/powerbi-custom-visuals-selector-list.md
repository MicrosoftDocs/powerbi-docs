&lt;!DOCTYPE html&gt;

<html>
  <head>
      <meta charset="utf-8" />
      <title>example-azure-selector-list</title>
      <style>.markdown-preview:not([data-use-github-style]) { padding: 2em; font-size: 1.2em; color: rgb(171, 178, 191); overflow: auto; background-color: rgb(40, 44, 52); }
.markdown-preview:not([data-use-github-style]) &gt; :first-child { margin-top: 0px; }
.markdown-preview:not([data-use-github-style]) h1, .markdown-preview:not([data-use-github-style]) h2, .markdown-preview:not([data-use-github-style]) h3, .markdown-preview:not([data-use-github-style]) h4, .markdown-preview:not([data-use-github-style]) h5, .markdown-preview:not([data-use-github-style]) h6 { line-height: 1.2; margin-top: 1.5em; margin-bottom: 0.5em; color: rgb(255, 255, 255); }
.markdown-preview:not([data-use-github-style]) h1 { font-size: 2.4em; font-weight: 300; }
.markdown-preview:not([data-use-github-style]) h2 { font-size: 1.8em; font-weight: 400; }
.markdown-preview:not([data-use-github-style]) h3 { font-size: 1.5em; font-weight: 500; }
.markdown-preview:not([data-use-github-style]) h4 { font-size: 1.2em; font-weight: 600; }
.markdown-preview:not([data-use-github-style]) h5 { font-size: 1.1em; font-weight: 600; }
.markdown-preview:not([data-use-github-style]) h6 { font-size: 1em; font-weight: 600; }
.markdown-preview:not([data-use-github-style]) strong { color: rgb(255, 255, 255); }
.markdown-preview:not([data-use-github-style]) del { color: rgb(124, 135, 156); }
.markdown-preview:not([data-use-github-style]) a, .markdown-preview:not([data-use-github-style]) a code { color: rgb(82, 139, 255); }
.markdown-preview:not([data-use-github-style]) img { max-width: 100%; }
.markdown-preview:not([data-use-github-style]) &gt; p { margin-top: 0px; margin-bottom: 1.5em; }
.markdown-preview:not([data-use-github-style]) &gt; ul, .markdown-preview:not([data-use-github-style]) &gt; ol { margin-bottom: 1.5em; }
.markdown-preview:not([data-use-github-style]) blockquote { margin: 1.5em 0px; font-size: inherit; color: rgb(124, 135, 156); border-color: rgb(75, 83, 98); border-width: 4px; }
.markdown-preview:not([data-use-github-style]) hr { margin: 3em 0px; border-top-width: 2px; border-top-style: dashed; border-top-color: rgb(75, 83, 98); background: none; }
.markdown-preview:not([data-use-github-style]) table { margin: 1.5em 0px; }
.markdown-preview:not([data-use-github-style]) th { color: rgb(255, 255, 255); }
.markdown-preview:not([data-use-github-style]) th, .markdown-preview:not([data-use-github-style]) td { padding: 0.66em 1em; border: 1px solid rgb(75, 83, 98); }
.markdown-preview:not([data-use-github-style]) code { color: rgb(255, 255, 255); background-color: rgb(58, 63, 75); }
.markdown-preview:not([data-use-github-style]) pre.editor-colors { margin: 1.5em 0px; padding: 1em; font-size: 0.92em; border-radius: 3px; background-color: rgb(49, 54, 63); }
.markdown-preview:not([data-use-github-style]) kbd { color: rgb(255, 255, 255); border-width: 1px 1px 2px; border-style: solid; border-color: rgb(75, 83, 98) rgb(75, 83, 98) rgb(62, 68, 81); background-color: rgb(58, 63, 75); }
.markdown-preview[data-use-github-style] { font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Segoe UI&#39;, Arial, freesans, sans-serif; line-height: 1.6; word-wrap: break-word; padding: 30px; font-size: 16px; color: rgb(51, 51, 51); overflow: scroll; background-color: rgb(255, 255, 255); }
.markdown-preview[data-use-github-style] &gt; :first-child { margin-top: 0px !important; }
.markdown-preview[data-use-github-style] &gt; :last-child { margin-bottom: 0px !important; }
.markdown-preview[data-use-github-style] a:not([href]) { color: inherit; text-decoration: none; }
.markdown-preview[data-use-github-style] .absent { color: rgb(204, 0, 0); }
.markdown-preview[data-use-github-style] .anchor { position: absolute; top: 0px; left: 0px; display: block; padding-right: 6px; padding-left: 30px; margin-left: -30px; }
.markdown-preview[data-use-github-style] .anchor:focus { outline: none; }
.markdown-preview[data-use-github-style] h1, .markdown-preview[data-use-github-style] h2, .markdown-preview[data-use-github-style] h3, .markdown-preview[data-use-github-style] h4, .markdown-preview[data-use-github-style] h5, .markdown-preview[data-use-github-style] h6 { position: relative; margin-top: 1em; margin-bottom: 16px; font-weight: bold; line-height: 1.4; }
.markdown-preview[data-use-github-style] h1 .octicon-link, .markdown-preview[data-use-github-style] h2 .octicon-link, .markdown-preview[data-use-github-style] h3 .octicon-link, .markdown-preview[data-use-github-style] h4 .octicon-link, .markdown-preview[data-use-github-style] h5 .octicon-link, .markdown-preview[data-use-github-style] h6 .octicon-link { display: none; color: rgb(0, 0, 0); vertical-align: middle; }
.markdown-preview[data-use-github-style] h1:hover .anchor, .markdown-preview[data-use-github-style] h2:hover .anchor, .markdown-preview[data-use-github-style] h3:hover .anchor, .markdown-preview[data-use-github-style] h4:hover .anchor, .markdown-preview[data-use-github-style] h5:hover .anchor, .markdown-preview[data-use-github-style] h6:hover .anchor { padding-left: 8px; margin-left: -30px; text-decoration: none; }
.markdown-preview[data-use-github-style] h1:hover .anchor .octicon-link, .markdown-preview[data-use-github-style] h2:hover .anchor .octicon-link, .markdown-preview[data-use-github-style] h3:hover .anchor .octicon-link, .markdown-preview[data-use-github-style] h4:hover .anchor .octicon-link, .markdown-preview[data-use-github-style] h5:hover .anchor .octicon-link, .markdown-preview[data-use-github-style] h6:hover .anchor .octicon-link { display: inline-block; }
.markdown-preview[data-use-github-style] h1 tt, .markdown-preview[data-use-github-style] h2 tt, .markdown-preview[data-use-github-style] h3 tt, .markdown-preview[data-use-github-style] h4 tt, .markdown-preview[data-use-github-style] h5 tt, .markdown-preview[data-use-github-style] h6 tt, .markdown-preview[data-use-github-style] h1 code, .markdown-preview[data-use-github-style] h2 code, .markdown-preview[data-use-github-style] h3 code, .markdown-preview[data-use-github-style] h4 code, .markdown-preview[data-use-github-style] h5 code, .markdown-preview[data-use-github-style] h6 code { font-size: inherit; }
.markdown-preview[data-use-github-style] h1 { padding-bottom: 0.3em; font-size: 2.25em; line-height: 1.2; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(238, 238, 238); }
.markdown-preview[data-use-github-style] h1 .anchor { line-height: 1; }
.markdown-preview[data-use-github-style] h2 { padding-bottom: 0.3em; font-size: 1.75em; line-height: 1.225; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(238, 238, 238); }
.markdown-preview[data-use-github-style] h2 .anchor { line-height: 1; }
.markdown-preview[data-use-github-style] h3 { font-size: 1.5em; line-height: 1.43; }
.markdown-preview[data-use-github-style] h3 .anchor { line-height: 1.2; }
.markdown-preview[data-use-github-style] h4 { font-size: 1.25em; }
.markdown-preview[data-use-github-style] h4 .anchor { line-height: 1.2; }
.markdown-preview[data-use-github-style] h5 { font-size: 1em; }
.markdown-preview[data-use-github-style] h5 .anchor { line-height: 1.1; }
.markdown-preview[data-use-github-style] h6 { font-size: 1em; color: rgb(119, 119, 119); }
.markdown-preview[data-use-github-style] h6 .anchor { line-height: 1.1; }
.markdown-preview[data-use-github-style] p, .markdown-preview[data-use-github-style] blockquote, .markdown-preview[data-use-github-style] ul, .markdown-preview[data-use-github-style] ol, .markdown-preview[data-use-github-style] dl, .markdown-preview[data-use-github-style] table, .markdown-preview[data-use-github-style] pre { margin-top: 0px; margin-bottom: 16px; }
.markdown-preview[data-use-github-style] hr { height: 4px; padding: 0px; margin: 16px 0px; border: 0px none; background-color: rgb(231, 231, 231); }
.markdown-preview[data-use-github-style] ul, .markdown-preview[data-use-github-style] ol { padding-left: 2em; }
.markdown-preview[data-use-github-style] ul.no-list, .markdown-preview[data-use-github-style] ol.no-list { padding: 0px; list-style-type: none; }
.markdown-preview[data-use-github-style] ul ul, .markdown-preview[data-use-github-style] ul ol, .markdown-preview[data-use-github-style] ol ol, .markdown-preview[data-use-github-style] ol ul { margin-top: 0px; margin-bottom: 0px; }
.markdown-preview[data-use-github-style] li &gt; p { margin-top: 16px; }
.markdown-preview[data-use-github-style] dl { padding: 0px; }
.markdown-preview[data-use-github-style] dl dt { padding: 0px; margin-top: 16px; font-size: 1em; font-style: italic; font-weight: bold; }
.markdown-preview[data-use-github-style] dl dd { padding: 0px 16px; margin-bottom: 16px; }
.markdown-preview[data-use-github-style] blockquote { padding: 0px 15px; color: rgb(119, 119, 119); border-left-width: 4px; border-left-style: solid; border-left-color: rgb(221, 221, 221); }
.markdown-preview[data-use-github-style] blockquote &gt; :first-child { margin-top: 0px; }
.markdown-preview[data-use-github-style] blockquote &gt; :last-child { margin-bottom: 0px; }
.markdown-preview[data-use-github-style] table { display: block; width: 100%; overflow: auto; word-break: keep-all; }
.markdown-preview[data-use-github-style] table th { font-weight: bold; }
.markdown-preview[data-use-github-style] table th, .markdown-preview[data-use-github-style] table td { padding: 6px 13px; border: 1px solid rgb(221, 221, 221); }
.markdown-preview[data-use-github-style] table tr { border-top-width: 1px; border-top-style: solid; border-top-color: rgb(204, 204, 204); background-color: rgb(255, 255, 255); }
.markdown-preview[data-use-github-style] table tr:nth-child(2n) { background-color: rgb(248, 248, 248); }
.markdown-preview[data-use-github-style] img { max-width: 100%; box-sizing: border-box; }
.markdown-preview[data-use-github-style] .emoji { max-width: none; }
.markdown-preview[data-use-github-style] span.frame { display: block; overflow: hidden; }
.markdown-preview[data-use-github-style] span.frame &gt; span { display: block; float: left; width: auto; padding: 7px; margin: 13px 0px 0px; overflow: hidden; border: 1px solid rgb(221, 221, 221); }
.markdown-preview[data-use-github-style] span.frame span img { display: block; float: left; }
.markdown-preview[data-use-github-style] span.frame span span { display: block; padding: 5px 0px 0px; clear: both; color: rgb(51, 51, 51); }
.markdown-preview[data-use-github-style] span.align-center { display: block; overflow: hidden; clear: both; }
.markdown-preview[data-use-github-style] span.align-center &gt; span { display: block; margin: 13px auto 0px; overflow: hidden; text-align: center; }
.markdown-preview[data-use-github-style] span.align-center span img { margin: 0px auto; text-align: center; }
.markdown-preview[data-use-github-style] span.align-right { display: block; overflow: hidden; clear: both; }
.markdown-preview[data-use-github-style] span.align-right &gt; span { display: block; margin: 13px 0px 0px; overflow: hidden; text-align: right; }
.markdown-preview[data-use-github-style] span.align-right span img { margin: 0px; text-align: right; }
.markdown-preview[data-use-github-style] span.float-left { display: block; float: left; margin-right: 13px; overflow: hidden; }
.markdown-preview[data-use-github-style] span.float-left span { margin: 13px 0px 0px; }
.markdown-preview[data-use-github-style] span.float-right { display: block; float: right; margin-left: 13px; overflow: hidden; }
.markdown-preview[data-use-github-style] span.float-right &gt; span { display: block; margin: 13px auto 0px; overflow: hidden; text-align: right; }
.markdown-preview[data-use-github-style] code, .markdown-preview[data-use-github-style] tt { padding: 0.2em 0px; margin: 0px; font-size: 85%; border-radius: 3px; background-color: rgba(0, 0, 0, 0.0392157); }
.markdown-preview[data-use-github-style] code::before, .markdown-preview[data-use-github-style] tt::before, .markdown-preview[data-use-github-style] code::after, .markdown-preview[data-use-github-style] tt::after { letter-spacing: -0.2em; content: &quot; &quot;; }
.markdown-preview[data-use-github-style] code br, .markdown-preview[data-use-github-style] tt br { display: none; }
.markdown-preview[data-use-github-style] del code { text-decoration: inherit; }
.markdown-preview[data-use-github-style] pre &gt; code { padding: 0px; margin: 0px; font-size: 100%; word-break: normal; white-space: pre; border: 0px; background: transparent; }
.markdown-preview[data-use-github-style] .highlight { margin-bottom: 16px; }
.markdown-preview[data-use-github-style] .highlight pre, .markdown-preview[data-use-github-style] pre { padding: 16px; overflow: auto; font-size: 85%; line-height: 1.45; border-radius: 3px; background-color: rgb(247, 247, 247); }
.markdown-preview[data-use-github-style] .highlight pre { margin-bottom: 0px; word-break: normal; }
.markdown-preview[data-use-github-style] pre { word-wrap: normal; }
.markdown-preview[data-use-github-style] pre code, .markdown-preview[data-use-github-style] pre tt { display: inline; max-width: initial; padding: 0px; margin: 0px; overflow: initial; line-height: inherit; word-wrap: normal; border: 0px; background-color: transparent; }
.markdown-preview[data-use-github-style] pre code::before, .markdown-preview[data-use-github-style] pre tt::before, .markdown-preview[data-use-github-style] pre code::after, .markdown-preview[data-use-github-style] pre tt::after { content: normal; }
.markdown-preview[data-use-github-style] kbd { display: inline-block; padding: 3px 5px; font-size: 11px; line-height: 10px; color: rgb(85, 85, 85); vertical-align: middle; border-style: solid; border-width: 1px; border-color: rgb(204, 204, 204) rgb(204, 204, 204) rgb(187, 187, 187); border-radius: 3px; box-shadow: rgb(187, 187, 187) 0px -1px 0px inset; background-color: rgb(252, 252, 252); }
.markdown-preview[data-use-github-style] a { color: rgb(51, 122, 183); }
.markdown-preview[data-use-github-style] code { color: inherit; }
.markdown-preview[data-use-github-style] pre.editor-colors { padding: 0.8em 1em; margin-bottom: 1em; font-size: 0.85em; border-radius: 4px; overflow: auto; }
.scrollbars-visible-always .markdown-preview pre.editor-colors::shadow .vertical-scrollbar, .scrollbars-visible-always .markdown-preview pre.editor-colors::shadow .horizontal-scrollbar { visibility: hidden; }
.scrollbars-visible-always .markdown-preview pre.editor-colors:hover::shadow .vertical-scrollbar, .scrollbars-visible-always .markdown-preview pre.editor-colors:hover::shadow .horizontal-scrollbar { visibility: visible; }
.bracket-matcher .region {
  border-bottom: 1px dotted lime;
  position: absolute;
}

.spell-check-misspelling .region {
  border-bottom: 2px dotted rgba(255, 51, 51, 0.75);
}

pre.editor-colors,
.host {
  background-color: #282c34;
  color: #abb2bf;
}
pre.editor-colors .line.cursor-line,
.host .line.cursor-line {
  background-color: rgba(153, 187, 255, 0.04);
}
pre.editor-colors .invisible,
.host .invisible {
  color: #abb2bf;
}
pre.editor-colors .cursor,
.host .cursor {
  border-left: 2px solid #528bff;
}
pre.editor-colors .selection .region,
.host .selection .region {
  background-color: #3e4451;
}
pre.editor-colors .bracket-matcher .region,
.host .bracket-matcher .region {
  border-bottom: 1px solid #528bff;
  box-sizing: border-box;
}
pre.editor-colors .invisible-character,
.host .invisible-character {
  color: rgba(171, 178, 191, 0.15);
}
pre.editor-colors .indent-guide,
.host .indent-guide {
  color: rgba(171, 178, 191, 0.15);
}
pre.editor-colors .wrap-guide,
.host .wrap-guide {
  background-color: rgba(171, 178, 191, 0.15);
}
pre.editor-colors .gutter .line-number,
.host .gutter .line-number {
  color: #636d83;
  -webkit-font-smoothing: antialiased;
}
pre.editor-colors .gutter .line-number.cursor-line,
.host .gutter .line-number.cursor-line {
  color: #abb2bf;
  background-color: #2c313a;
}
pre.editor-colors .gutter .line-number.cursor-line-no-selection,
.host .gutter .line-number.cursor-line-no-selection {
  background-color: transparent;
}
pre.editor-colors .gutter .line-number .icon-right,
.host .gutter .line-number .icon-right {
  color: #abb2bf;
}
pre.editor-colors .gutter:not(.git-diff-icon) .line-number.git-line-removed.git-line-removed::before,
.host .gutter:not(.git-diff-icon) .line-number.git-line-removed.git-line-removed::before {
  bottom: -3px;
}
pre.editor-colors .gutter:not(.git-diff-icon) .line-number.git-line-removed::after,
.host .gutter:not(.git-diff-icon) .line-number.git-line-removed::after {
  content: &quot;&quot;;
  position: absolute;
  left: 0px;
  bottom: 0px;
  width: 25px;
  border-bottom: 1px dotted rgba(224, 82, 82, 0.5);
  pointer-events: none;
}
pre.editor-colors .gutter .line-number.folded,
.host .gutter .line-number.folded,
pre.editor-colors .gutter .line-number:after,
.host .gutter .line-number:after,
pre.editor-colors .fold-marker:after,
.host .fold-marker:after {
  color: #abb2bf;
}
.comment {
  color: #5c6370;
  font-style: italic;
}
.entity.name.type {
  color: #e5c07b;
}
.entity.other.inherited-class {
  color: #98c379;
}
.keyword {
  color: #c678dd;
}
.keyword.control {
  color: #c678dd;
}
.keyword.operator {
  color: #abb2bf;
}
.keyword.other.special-method {
  color: #61afef;
}
.keyword.other.unit {
  color: #d19a66;
}
.storage {
  color: #c678dd;
}
.storage.type.annotation,
.storage.type.primitive {
  color: #c678dd;
}
.storage.modifier.package,
.storage.modifier.import {
  color: #abb2bf;
}
.constant {
  color: #d19a66;
}
.constant.variable {
  color: #d19a66;
}
.constant.character.escape {
  color: #56b6c2;
}
.constant.numeric {
  color: #d19a66;
}
.constant.other.color {
  color: #56b6c2;
}
.constant.other.symbol {
  color: #56b6c2;
}
.variable {
  color: #e06c75;
}
.variable.interpolation {
  color: #be5046;
}
.variable.parameter {
  color: #abb2bf;
}
.string {
  color: #98c379;
}
.string.regexp {
  color: #56b6c2;
}
.string.regexp .source.ruby.embedded {
  color: #e5c07b;
}
.string.other.link {
  color: #e06c75;
}
.punctuation.definition.comment {
  color: #5c6370;
}
.punctuation.definition.method-parameters,
.punctuation.definition.function-parameters,
.punctuation.definition.parameters,
.punctuation.definition.separator,
.punctuation.definition.seperator,
.punctuation.definition.array {
  color: #abb2bf;
}
.punctuation.definition.heading,
.punctuation.definition.identity {
  color: #61afef;
}
.punctuation.definition.bold {
  color: #e5c07b;
  font-weight: bold;
}
.punctuation.definition.italic {
  color: #c678dd;
  font-style: italic;
}
.punctuation.section.embedded {
  color: #be5046;
}
.punctuation.section.method,
.punctuation.section.class,
.punctuation.section.inner-class {
  color: #abb2bf;
}
.support.class {
  color: #e5c07b;
}
.support.type {
  color: #56b6c2;
}
.support.function {
  color: #56b6c2;
}
.support.function.any-method {
  color: #61afef;
}
.entity.name.function {
  color: #61afef;
}
.entity.name.class,
.entity.name.type.class {
  color: #e5c07b;
}
.entity.name.section {
  color: #61afef;
}
.entity.name.tag {
  color: #e06c75;
}
.entity.other.attribute-name {
  color: #d19a66;
}
.entity.other.attribute-name.id {
  color: #61afef;
}
.meta.class {
  color: #e5c07b;
}
.meta.class.body {
  color: #abb2bf;
}
.meta.method-call,
.meta.method {
  color: #abb2bf;
}
.meta.definition.variable {
  color: #e06c75;
}
.meta.link {
  color: #d19a66;
}
.meta.require {
  color: #61afef;
}
.meta.selector {
  color: #c678dd;
}
.meta.separator {
  background-color: #373b41;
  color: #abb2bf;
}
.meta.tag {
  color: #abb2bf;
}
.none {
  color: #abb2bf;
}
.invalid.deprecated {
  color: #523d14 !important;
  background-color: #e0c285 !important;
}
.invalid.illegal {
  color: #ffffff !important;
  background-color: #e05252 !important;
}
.markup.bold {
  color: #d19a66;
  font-weight: bold;
}
.markup.changed {
  color: #c678dd;
}
.markup.deleted {
  color: #e06c75;
}
.markup.italic {
  color: #c678dd;
  font-style: italic;
}
.markup.heading .punctuation.definition.heading {
  color: #61afef;
}
.markup.inserted {
  color: #98c379;
}
.markup.list {
  color: #e06c75;
}
.markup.quote {
  color: #d19a66;
}
.markup.raw {
  color: #98c379;
}
.source.cs .keyword.operator {
  color: #c678dd;
}
.source.css .property-name,
.source.css .property-value {
  color: #828997;
}
.source.css .property-name.support,
.source.css .property-value.support {
  color: #abb2bf;
}
.source.gfm .markup {
  -webkit-font-smoothing: auto;
}
.source.gfm .markup.heading {
  color: #e06c75;
}
.source.gfm .markup.link {
  color: #c678dd;
}
.source.gfm .link .entity {
  color: #61afef;
}
.source.ini .keyword.other.definition.ini {
  color: #e06c75;
}
.source.java .storage.modifier.import {
  color: #e5c07b;
}
.source.java .storage.type {
  color: #e5c07b;
}
.source.java-properties .meta.key-pair {
  color: #e06c75;
}
.source.java-properties .meta.key-pair &gt; .punctuation {
  color: #abb2bf;
}
.source.json .meta.structure.dictionary.json &gt; .string.quoted.json {
  color: #e06c75;
}
.source.json .meta.structure.dictionary.json &gt; .string.quoted.json &gt; .punctuation.string {
  color: #e06c75;
}
.source.json .meta.structure.dictionary.json &gt; .value.json &gt; .string.quoted.json,
.source.json .meta.structure.array.json &gt; .value.json &gt; .string.quoted.json,
.source.json .meta.structure.dictionary.json &gt; .value.json &gt; .string.quoted.json &gt; .punctuation,
.source.json .meta.structure.array.json &gt; .value.json &gt; .string.quoted.json &gt; .punctuation {
  color: #98c379;
}
.source.json .meta.structure.dictionary.json &gt; .constant.language.json,
.source.json .meta.structure.array.json &gt; .constant.language.json {
  color: #56b6c2;
}
.source.ruby .constant.other.symbol &gt; .punctuation {
  color: inherit;
}
.source.python .keyword.operator.logical.python {
  color: #c678dd;
}
.source.python .variable.parameter {
  color: #d19a66;
}
</style>
  </head>
  <body class='markdown-preview'><p>﻿&gt; [AZURE.SELECTOR-LIST (Desktop | Powerbi.com )]</p>
<ul>
<li><a href="../powerbi-custom-visuals-use.md">(Desktop | More detail )</a></li>
<li><a href="../powerbi-custom-visuals-use-less.md">(Desktop | Less detail )</a></li>
<li><a href="../powerbi-custom-visuals-vid.md">(Desktop | Show me )</a></li>
<li><a href="../powerbi-custom-visuals-add-to-report.md">(Powerbi.com | More detail )</a></li>
<li><a href="../powerbi-custom-visuals-add-to-report-less.md">(Powerbi.com | Less detail )</a></li>
<li><a href="../powerbi-custom-visuals-add-to-report-viz.md">(Powerbi.com | Show me )</a></li>
</ul></body>
</html>
