Blog.PostsController = Ember.ArrayController.extend
  actions:
    delete: (post) ->
      post.deleteRecord()
      post.save()
