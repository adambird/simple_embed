# simple_embed

Ruby gem for generating embed code from URLs

I could have done this with embed.ly but they don't support the websites we need for http://rides.bunch.cc. Decided to open source the thing in case someone else might find it useful

## Usage

Reference the gem 

	gem 'simple_embed', :git => 'https://github.com/adambird/simple_embed.git'
	
and then use the `auto_embed` method to convert the text

	text = "some text around a video http://vimeo.com/5951947 and after"
	text_with_embed = SimpleEmbed.auto_embed(text)

You can also look up the embed code directly for a link

	embed_code = SimpleEmbed.embed_code("http://vimeo.com/5951947")

### Options

The `auto_embed` and `embed_code` support the following options hash as an optional argument

```ruby
{
  no_follow: true
}
```

`no_follow` set to true will add `rel="nofollow"` to all default links