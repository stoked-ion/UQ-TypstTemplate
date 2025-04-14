//*
#import "@preview/slydst:0.1.4": *
#show: slides.with(
  title: "Very Cool Project",
  subtitle: "Cool Conference",
  authors: "John Doe",
  title-color: rgb("#51247A"), // UQ Purple-500 (Primary brand colour)
  ratio: 16/10,
  )
#show raw: set block(fill: silver.lighten(65%), width: 100%, inset: 1em)

// The lines below automatically convert citations to footnotes
#set cite(style: "harvard-cite-them-right")
#show cite: it => footnote[#it]

= Big Title // One '=' creates an individual title slide.

== Introduction // Two '==' creates a slide with a heading
Slides are easily created in the 'Slydst' package using similar syntax with that of the documents. We use the number of '=' signs to create different level of headings.
=== Context
Sub headings remain in the same slide. Equations, tables and figures follow the same format. You can easily copy and paste from typst documents.

== Literature Review
#{set text(style: "italic")
[
There once was a cat, \
Who a physicist liked. \
Beloved was he,\
His initials are now etched to cite.
]}
// You can also use '\' to create a new line in the text.
#v(1cm) // This is a function that creates vertical space between elements.
Interesting paper. Ceowler author. @hetherington1975two



== Bibliography

#bibliography("Bibliography.bib")