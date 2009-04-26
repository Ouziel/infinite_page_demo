class AddTestData < ActiveRecord::Migration
  def self.up
    ActiveRecord::Base.record_timestamps = false
    name = generate_random_lopsem
    1000.times do |i|
      Post.create(
        :name => generate_random_name,
        :title => generate_random_lopsem ('words',8).humanize,
        :content => generate_random_lopsem.humanize,
        :created_at => Time.now.ago(3600*i),
        :updated_at => Time.now.ago(3600*i)
      )
    end
  end
  
  def self.down
    Post.delete_all
  end
  
  private
    def self.generate_random_lopsem type = 'paragraphs', count=1
      #gem install lorem
      Lorem::Base.new(type, count).output.split.sort_by{rand}.join(' ').chop.chop+'.'
    end
    
    def self.generate_random_name 
      name = ['Jean', 'Jacques', 'Pierre', 'Paul', 'Jeanne', 'Jacquelines', 'Paulette', 'Pierette'].at(rand(8))
      name << ' '
      name << ['Dupont', 'Durand', 'Petit', 'Grand', 'Gros', 'Maigre'].at(rand(6))  
    end
  
end

