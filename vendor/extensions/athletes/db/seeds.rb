Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-athletes').blank?
        user.plugins.create(:name => 'refinerycms-athletes',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

  @athletes = [
    {name: 'Richard Bohus', nationality: 'Hungary', specialty: 'Sprint Backstroke/Freestyle', club_team: 'Bekescsabai Elore Uszo Klub', description: '<ul><li>Olympic Games 22nd place finisher in 2012, London</li><li>National Record Holder LCM 50m backstroke (25.14)</li><li>European Championship Bronze Medalist</li><li>European Junior Championship Bronze Medalist</li></ul>'},
    {name: 'Tilde Lundmark', nationality: 'Sweden', specialty: 'Backstroke/Distance Free', club_team: 'SK S02', description: '<ul><li>One of the promising up-and-coming young Swedish swimmers</li><li>Swedish Youth Champion, 200M Backstroke</li><li>Multiple Swedish Youth Medalist</li></ul>'},
    {name: 'Linn Suchomel', nationality: 'Sweden', specialty: 'NA', club_team: 'Skovde SS', description: '<p>Linn is currently one of the most promising youth swimmers in Sweden with 20 Nordic Youth Open medals, 9 gold, and 1 record. On a daily basis, she is constantly fighting her type 1 diabetes mellitus in order to maintain normal blood glucose levels, which challenges her training regimen. Together with Swimmer Strength, Linn is increasing her body awareness early by properly staying engaged in prehab and core stability exercises. As early as the young age of 11, Linn has the goal to one day swim in the Olympics.</p>'}
  ]

  @athletes.each do |a|
    Refinery::Athletes::Athlete.create(
        name: a[:name],
        nationality: a[:nationality],
        specialty: a[:specialty],
        club_team: a[:club_team],
        description: a[:description]
      )
  end

end
