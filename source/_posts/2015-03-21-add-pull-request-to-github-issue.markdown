---
layout: post
title: "Append a pull request to a existing github issue"
comments: true
published: true
categories:
  - git

---

Install [hub].

    hub pull-request -i ISSUE_NUMBER -b MAIN_USERNAME:MAIN_BRANCH -h FORK_USERNAME:FORK_BRANCH ISSUE_URL

[hub]: https://github.com/defunkt/hub