# name: category-editing-toggle
# about: displays a toggle in settings and then a category setting to make posts within uneditable.
# version: 0.1
# authors: Dan Vayn

enabled_site_setting :editless_categories_enabled

after_initialize do
  require_dependency 'post'
  on(:post_created) do |post, params|
    if SiteSetting.editless_categories_enabled && post.category.custom_fields["force_editless_posting"] == "true"
      post.locked_by_id = -1
      post.save!
    end
  end
end
