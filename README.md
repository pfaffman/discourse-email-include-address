# DiscourseEmailIncludeAddress

DiscourseEmailIncludeAddress is a plugin for communities that really, really like mailing lists and want to be able to email people when they get a notification rather than replying through Discourse.

It exposes users' email addresses, so I don't recommend it unless your users all expect a level of privacy associated with 1990s era Mailing lists.

## Installation

Follow [Install a Plugin](https://meta.discourse.org/t/install-a-plugin/19157)
how-to from the official Discourse Meta, using `git clone https://github.com/pfaffman/discourse-email-include-address.git`
as the plugin command.

## Usage

Is at your own risk.

## Feedback

If you have issues or suggestions for the plugin, please bring them up on
[support.literatecomputing.com](https://support.literatecomputing.com/t/discourse-email-include-address-plugin/373).

## Testing

Tests are run regularly at https://travis-ci.org/github/pfaffman/discourse-email-include-address/

The spec tests only if the `./app/views/email/_post.html.erb` template gets updated in Discourse
by checking to see if the md5 of that file has changed since the most recent update. There isn't much else that can go wrong.

If it break, I should notice, and if the client who uses it is still using it, I will likely fix it.
