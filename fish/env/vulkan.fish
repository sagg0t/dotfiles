set -l VK_SDK_PATH ~/Library/VulkanSDK/1.3.243.0

set -Ux VULKAN_SDK $VK_SDK_PATH/macOS
set -a PATH $VULKAN_SDK/bin
set -ax DYLD_LIBRARY_PATH $VULKAN_SDK/lib
# echo "This script is now using VK_ADD_LAYER_PATH instead of VK_LAYER_PATH"
set -Ux VK_ADD_LAYER_PATH $VULKAN_SDK/share/vulkan/explicit_layer.d
set -Ux VK_ICD_FILENAMES $VULKAN_SDK/share/vulkan/icd.d/MoltenVK_icd.json
set -Ux VK_DRIVER_FILES $VULKAN_SDK/share/vulkan/icd.d/MoltenVK_icd.json
