# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
titles = ["Software Engineer", "Data Engineer", "Product Manager", "Bus Driver", "Nurse"]
names  = ["Hans Pörksen", "Ole Johansen", "Niels Petersen", "Harm Scharft", "Roland Hansen", "Mette Jeppesen"]
application_states = ["applied", "interview", "hired", "rejected"]
job_states = ["activated", "deactivated"]
job_ids = []
for level in (1..3) do
    titles.each do |t|
        job = Job.find_or_create_by!(title: "#{t} #{level}")
        job.update(status: job_states[rand(2)])
        job_ids << job.id
    end
end
job_ids.each do |job_id|
    nr_applications = rand(2)+1
    for i in (1 .. nr_applications) do
        application = Application.find_or_create_by!(job_id: job_id, candidate_name: names[rand(names.size)])
        application.update(status: application_states[rand(4)])
    end    
end


