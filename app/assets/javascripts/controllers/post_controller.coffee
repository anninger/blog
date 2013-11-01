Blog.PostController = Ember.ObjectController.extend
  newComment: null

  actions:
    addComment: ->
      comment = @get('store').createRecord 'comment',
                                           post: @get('model'),
                                           content: @get('newComment')
      comment.save()
