```ruby
# frozen_string_literal: true

require 'aws-sdk-ec2'
def select_subnet(subnets)
  client = Aws::EC2::Client.new( region: 'ap-northeast-1')
  ec2_resource = Aws::EC2::Resource.new(client: client)
  ec2_resource.subnets({ subnet_ids: subnets }).max_by {|subnet| subnet.available_ip_address_count }.id

end

subnets = %w[subnet-11111111111 subnet-22222222222]

#subnet = select_subnet(subnets)
#puts subnet
puts select_subnet(subnets)
```
