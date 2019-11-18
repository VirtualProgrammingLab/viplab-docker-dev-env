rakefile 'vip_init.rake', <<-CODE
namespace :db do
  desc "Create VIP resources"
  task :vip_init => :environment do
    Organization.create :name => "vip",
      :description => "For VipLab",
      :abrev => "vip" if Organization.find_by_name("vip").nil?
    Community.create :name => "vip",
      :description => "For Viplab." if Community.find_by_name("vip").nil?
    Participant.create :name => "backend",
      :description => "the new vip backend",
      :dns => 'backend',
      :community_selfrouting => false,
      :organization_id => Organization.find_by_name("vip").id if Participant.find_by_name("backend").nil?
    Identity.create :name => "backend",
      :description => "htaccess passwd",
      :participant_id => Participant.find_by_name("backend").id if Participant.find_by_name("backend")&.identities&.find_by_name("backend").nil?
    Participant.create :name => "vipcc",
      :description => "vip computation client",
      :dns => 'vipb1',
      :community_selfrouting => false,
      :organization_id => Organization.find_by_name("vip").id if Participant.find_by_name("vipcc").nil?
    Identity.create :name => "vipcc",
      :description => "htaccess passwd",
      :participant_id => Participant.find_by_name("vipcc").id  if Participant.find_by_name("vipcc")&.identities&.find_by_name("vipcc").nil?
    Membership.create :participant_id => Participant.find_by_name("backend").id,
      :community_id => Community.find_by_name("vip").id if Membership.for_participant_id_and_community_id(Participant.find_by_name("backend").id, Community.find_by_name("vip").id).empty?
    Membership.create :participant_id => Participant.find_by_name("vipcc").id,
      :community_id => Community.find_by_name("vip").id if Membership.for_participant_id_and_community_id(Participant.find_by_name("vipcc").id, Community.find_by_name("vip").id).empty?
  end
end
CODE

rake "db:vip_init"
