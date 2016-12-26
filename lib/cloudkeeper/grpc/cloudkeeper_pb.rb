# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: cloudkeeper.proto

require 'google/protobuf'

require 'google/protobuf/empty_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message 'cloudkeeper.grpc.Appliance' do
    optional :identifier, :string, 1
    optional :title, :string, 2
    optional :description, :string, 3
    optional :mpuri, :string, 4
    optional :group, :string, 5
    optional :ram, :int32, 6
    optional :core, :int32, 7
    optional :version, :string, 8
    optional :architecture, :string, 9
    optional :operating_system, :string, 10
    optional :vo, :string, 11
    optional :expiration_date, :int32, 12
    optional :image_list_identifier, :string, 13
    optional :image, :message, 14, 'cloudkeeper.grpc.Image'
    map :attributes, :string, :string, 15
  end
  add_message 'cloudkeeper.grpc.Image' do
    optional :mode, :enum, 1, 'cloudkeeper.grpc.Image.Mode'
    optional :location, :string, 2
    optional :format, :enum, 3, 'cloudkeeper.grpc.Image.Format'
    optional :uri, :string, 4
    optional :checksum, :string, 5
    optional :size, :int32, 6
    optional :username, :string, 7
    optional :password, :string, 8
  end
  add_enum 'cloudkeeper.grpc.Image.Mode' do
    value :LOCAL, 0
    value :REMOTE, 1
  end
  add_enum 'cloudkeeper.grpc.Image.Format' do
    value :RAW, 0
    value :OVA, 1
    value :QCOW2, 2
    value :VMDK, 3
  end
  add_message 'cloudkeeper.grpc.ImageListIdentifier' do
    optional :image_list_identifier, :string, 1
  end
  add_message 'cloudkeeper.grpc.Status' do
    optional :code, :enum, 1, 'cloudkeeper.grpc.Status.Code'
    optional :message, :string, 2
  end
  add_enum 'cloudkeeper.grpc.Status.Code' do
    value :SUCCESS, 0
    value :ERROR, 1
    value :ERROR_APPLIANCE_NOT_FOUND, 2
    value :ERROR_APPLIANCE_TRANSFER, 3
    value :ERROR_AUTHENTICATION, 4
    value :ERROR_USER_NOT_AUTHORIZED, 5
    value :ERROR_RESOURCE_NOT_FOUND, 6
    value :ERROR_RESOURCE_RETRIEVAL, 7
    value :ERROR_RESOURCE_STATE, 8
  end
end

module Cloudkeeper
  module Grpc
    Appliance = Google::Protobuf::DescriptorPool.generated_pool.lookup('cloudkeeper.grpc.Appliance').msgclass
    Image = Google::Protobuf::DescriptorPool.generated_pool.lookup('cloudkeeper.grpc.Image').msgclass
    Image::Mode = Google::Protobuf::DescriptorPool.generated_pool.lookup('cloudkeeper.grpc.Image.Mode').enummodule
    Image::Format = Google::Protobuf::DescriptorPool.generated_pool.lookup('cloudkeeper.grpc.Image.Format').enummodule
    ImageListIdentifier = Google::Protobuf::DescriptorPool.generated_pool.lookup('cloudkeeper.grpc.ImageListIdentifier').msgclass
    Status = Google::Protobuf::DescriptorPool.generated_pool.lookup('cloudkeeper.grpc.Status').msgclass
    Status::Code = Google::Protobuf::DescriptorPool.generated_pool.lookup('cloudkeeper.grpc.Status.Code').enummodule
  end
end