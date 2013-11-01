Blog.Post = DS.Model.extend
  comments: DS.hasMany 'comment'
  title: DS.attr('string')
  body: DS.attr('string')

Blog.Post.FIXTURES = [{
  id: 1
  title: "my posts"
  body: "you are a boy, but you are a girle"
  comments: [1, 3]
}, {
  id: 2
  title:" my web"
  body:" he is a pretty dog,but he is an apple."
  comments: [2]
}]
