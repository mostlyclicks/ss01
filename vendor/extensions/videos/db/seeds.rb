Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-videos').blank?
        user.plugins.create(:name => 'refinerycms-videos',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

end
