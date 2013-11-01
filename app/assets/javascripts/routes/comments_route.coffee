Blog.CommentsRoute = Ember.Route.extend
  model: ->
    @get('store').find 'comment'
