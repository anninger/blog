# For more information see: http://emberjs.com/guides/routing/

Blog.Router.map ()->
  @resource 'posts', ->
    @route 'new'
    @resource 'post', path: ':post_id', ->
      @route 'edit'
  @resource 'comments', ->
    @route 'comment', path: ':comment_id'
