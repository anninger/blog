# http://emberjs.com/guides/models/using-the-store/

#Blog.Store = DS.Store.extend
  # Override the default adapter with the `DS.ActiveModelAdapter` which
  # is built to work nicely with the ActiveModel::Serializers gem.
  #adapter: '_ams'

Blog.ApplicationAdapter = DS.ActiveModelAdapter.extend()
Blog.ApplicationSerializer = DS.ActiveModelSerializer.extend()
