Blog.CommentsCommentController = Ember.ObjectController.extend
  actions:
      delete: ->
        comment = @get 'model'
        comment.deleteRecord()
        comment.save().then =>
          @transitionToRoute 'comments'
