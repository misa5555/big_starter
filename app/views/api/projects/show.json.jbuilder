json.extract! @project, :id, :title, :description

json.project_photo_url @project.project_photo.url()
json.project_photo_url @project.project_photo.url(:big)

json.backers @project.backers do |backer|
  json.extract! backer, :id, :username
  #json.avator_url backer.avator.url()
  json.avator_url backer.avator.url(:middle)
end

json.comments @project.comments do |comment|
  json.extract! comment, :id, :body, :author_id, :project_id, :created_at, :updated_at
  author = User.find(comment.author_id)
  json.author_username author.username 
  json.author_avator_url author.avator.url(:middle)
end

json.current_user_id current_user.id
json.current_user_name current_user.username
json.current_user_avator_url current_user.avator.url(:middle)
