Blog.PostController = Ember.ObjectController.extend
  newComment: null

  actions:
    addComment: ->
      comment = @get('store').createRecord 'comment',
                                           post: @get('model'),
                                           content: @get('newComment')
      comment.save().then (c) =>
        @get('model.comments').addObject(c)
        @set('newComment', '')

    deleteComment: (comment)->
      comment.deleteRecord()
      comment.save().then (c) =>
        @get('model.comments').removeObject(c)
