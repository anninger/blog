Blog.Comment = DS.Model.extend 
  post: DS.belongsTo 'post'
  content: DS.attr('string')
