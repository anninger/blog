Blog.PostRoute = Ember.Route.extend
  model: (params) ->
    @get('store').find 'post', params.post_id

  actions:
    save: ->
      @get('controller.model').save().then (post) =>
        @transitionTo 'post', post
