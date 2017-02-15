class BulkUpload < ApplicationRecord
	mount_uploader :attachment, AttachmentUploader
end
