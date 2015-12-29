#let(:label) { Label.create!(name: 'Label') }
#let(:label2) {Label.create!(name: 'Label2')}

FactoryGirl.define do
   factory :label, class: Label do
     name "label"
   end

   factory :label2, class: Label do
     name "label2"
   end

end
