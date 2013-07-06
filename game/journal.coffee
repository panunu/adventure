class @Journal
  write: (content) -> $('#journal .content').prepend '<p>' + content + '</p>'