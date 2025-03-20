@args username: *ZmplValue, user_image: *ZmplValue, timestamp: *ZmplValue, source_url: *ZmplValue, source_title: *ZmplValue, highlight: *ZmplValue, tags: *ZmplValue, note: *ZmplValue, likes: *ZmplValue, is_public: *ZmplValue

<!-- Zig mode-->
@zig {
  if (std.mem.eql(u8, "zmpl is simple", "zmpl" ++ " is " ++ "simple")) {
    <span>Zmpl is simple!</span>
  }
}

<!-- HTML mode -->
<div>Email: {{$.user.email}}</div>
<div>Token: {{$.auth.token}}</div>

<!-- Markdown mode -->
@markdown {
  # Built-in markdown support

  ## This works!
  - [Markdown](https://www.markdownguide.org/)

  * [jetzig.dev](https://www.jetzig.dev/)
}

@markdown {
    Some _very convenient_ markdown.
    References are supported too: {{.user.email}}
}

<!-- Partials -->
@partial example_partial

<!-- Partials with positional args -->
@partial mailto($.user.email, "Welcome to Jetzig!")

<!-- Partials with keyword args --->
@partial mailto(email: $.user.email, subject: "Welcome to Jetzig!")

<!-- Partials with slots --->
@partial mailto(email: $.user.email, subject: "Welcome to Jetzig!") {
  <a href="https://example.com/auth/{{$.auth.token}}">Sign in</a>
  <a href="https://example.com/unsubscribe/{{$.auth.token}}">Unsubscribe</a>
}


<div>Some regular HTML</div>

@zig {
    var x = 0;

    <div>Some HTML inside a Zig block. {{variable}}</div>

    if (true) {
        var x = 0;
        while (x < 10) {
            x += 1;
        }
    }
}

<div>Mixed blocks</div>

@markdown {
  # Header

  1. List {{item}} 1
  1. List item 2
}

@html {
  Hello this should still be HTML <span>Hello HTML</span>
  <div>Some HTML inside markdown</div>
}

@html {
    <div>Some HTML</div>

    @zig {
        var x = 0;
    }

    <span>Back to HTML</span>
}
