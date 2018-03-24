---
layout: post
title: Jekyll websites and blog subdirectories
date: 2018-03-24 13:00:09
comments: true
---
This site is using a single Jekyll installation for a static portfolio website and a blog. I wanted the blog in a /blog subdirectory with its own HTML layout & stylesheet, so I added the following files to my Jekyll installation:

{% highlight bash %}
├── _layouts
|   └── blog.html # HTML template for blog
|   └── blog-archive.html # HTML template for the blog archive
├── blog
|   └── index.html # jekyll loop for main blog page
|   └── archive.html # jekyll loop blog archive
├── css
|   └── blog.css # blog style sheet
{% endhighlight %}

Here's the breakdown:

- _layouts/blog.html: contains the markup for the blog's homepage.
- _layouts/blog-archive.html: contains the markup for the blog's archive page
- blog/index.html: contains the jekyll loop for the main blog page. It should include YAML metadata at the top that specifies <code>layout: blog</code>. When you run <code>jekyll build</code> from the terminal, Jekyll will import the contents of this blog folder into the generated site, so the folder needs to be titled "blog" and this file needs to be named "index.html"
- blog/archive.html: same as above, but this is the archive loop. It gets a <code>layout: blog-archive</code> YAML entry, which will wrap it in the contents of "_layouts/blog-archive.html".
- css/blog.css: The blog has its own CSS file so I can easily tinker with the design. (This is called in the /_layouts files.) I could've instead added the blog's styles to the site's main .sass file, but I found it easier to just work with standalone css.

Finally, you'll need a couple of YAML values in _config.yml for permalinks and pagination. Here's what I'm using:

{% highlight YAML %}
permalink: "/blog/:categories/:year/:month/:day/:title.html"
paginate: 20
paginate_path: "/blog/page:num/"
plugins: [jekyll-paginate]
{% endhighlight %}

I pulled all this from several different blog tutorials (thank you, generous Jekyll bloggers!) and the Jekyll docs. This setup makes much more sense in context, so if you're trying to do the same, you might find it helpful to look at the [this site's source code on Github](https://github.com/timlockridge/timlockridgedotcom).
