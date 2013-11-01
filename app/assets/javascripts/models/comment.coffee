Blog.Comment = DS.Model.extend 
  post: DS.belongsTo 'post'
  content: DS.attr('string')

Blog.Comment.FIXTURES = [{
   id: 1
   content: "you are a dog!!"
   post: 1
  }, {
   id: 2
   content: "he is a blog!!"
   post: 2
  }, {
   id: 3
   content: "3 he is a blog!!"
   post: 1
  }]
