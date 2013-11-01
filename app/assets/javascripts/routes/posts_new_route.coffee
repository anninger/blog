Blog.PostsNewRoute = Ember.Route.extend
  model: ->
    @get('store').createRecord 'post'

  exit: ->
    @_super()
    @get('controller.model').rollback()

  actions:
    save: ->
      @get('controller.model').save().then (post) =>
        @transitionTo 'post', post
