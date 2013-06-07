---
layout: post
title: "CodeMirror 2 ~ Smarty (*.tpl) Syntax Highlighting Mode"
date: 2009-10-11 11:10
comments: true
categories:
- Code
- Javascript

---


Quick and dirty, but way better than nothing !

``` javascript
CodeMirror.defineMode("tpl", function() {
  return {
    token: function(stream) {

      var ch = stream.next();

      if (ch == '{') {

        if (stream.peek() == '$') {
          // Variable
          stream.skipTo('}');
          stream.next();

          return 'smarty_variable';
        } else if (stream.peek() == '*') {
          // Comment
          stream.skipTo('}');
          stream.next();

          return 'smarty_comment';
        } else {
          // Logic
          stream.skipTo('}');
          stream.next();

          return 'smarty_logic';
        }

      }

    }
  };
});

CodeMirror.defineMIME("text/tpl", "tpl");
```

If you improve it, please send me feedback in the comments !