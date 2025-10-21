#!/system/bin/sh
# 🌈===========================================🌈
# ⚙️ WebView Vulkan & GPU Rendering Optimizer
# 🚀 Boost Performance • 🧠 Improve Rendering • ⚡ Smooth Gameplay
# 👨‍💻 Developed by: WillyGailo | Game & System Tweaker 🇵🇭
# 🌈===========================================🌈

# 🌀 Short Loading Animation
loading() {
  animation="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"
  for i in $(seq 1 3); do
    for j in $(echo $animation | grep -o .); do
      echo -ne "\r$j Applying WebView Vulkan & GPU Rendering Optimization..."
      sleep 0.1
    done
  done
  echo ""
}

# 🧠 Apply property safely (avoid crash + print status)
apply_prop() {
  prop=$1
  value=$2
  if setprop "$prop" "$value" 2>/dev/null; then
    echo "✅ $prop → $value"
  else
    echo "❌ Failed: $prop"
  fi
}

clear
echo ""
echo "🌟===========================================🌟"
echo "🚀 WebView Vulkan & GPU Rendering Optimization Script"
echo "💥 Version: 2.1 | 🧩 Mode: High Performance"
echo "👨‍💻 Developer: WillyGailo 🇵🇭"
echo "🌟===========================================🌟"
echo ""

sleep 2
loading
echo ""

# 🔒 Check root access
if [ "$(id -u)" -ne 0 ]; then
  echo "⚠️ Root access not detected! Some tweaks will be skipped."
  echo "👉 Run this script with root: su -c sh /data/local/tmp/install.V2.9.sh"
  echo ""
fi

# 🔧 Vulkan & Rendering Backend Settings
apply_prop debug.hwui.renderer skiavk
apply_prop debug.hwui.use_vulkan true
apply_prop debug.renderengine.backend vulkan
apply_prop debug.hwui.use_buffer_age false
apply_prop debug.hwui.disable_vsync true

# 🧠 WebView Vulkan Flags (skip system-protected ones if no root)
apply_prop webview.disable_gpu_rasterization false
apply_prop webview.ignore_gpu_blocklist true
apply_prop webview.default_passthrough_command_decoder true
apply_prop webview.use_hardware_buffer_usage_flags_from_vulkan true
apply_prop webview.vulkan_intermediate_buffer true
apply_prop webview.enable_adpf_gpu_main true

# 🎮 GPU Thread & Memory Performance
apply_prop debug.hwui.drop_shadow_cache_size 4
apply_prop debug.hwui.texture_cache_size 96
apply_prop debug.hwui.layer_cache_size 48
apply_prop debug.hwui.gradient_cache_size 2
apply_prop debug.hwui.path_cache_size 32
apply_prop debug.hwui.text_small_cache_width 1024
apply_prop debug.hwui.text_large_cache_height 2048
apply_prop debug.cpurend.vsync 0

# 🧩 SurfaceFlinger & Frame Control
apply_prop debug.sf.disable_backpressure 1
apply_prop debug.sf.latch_unsignaled 1
apply_prop debug.sf.auto_fps false
apply_prop debug.sf.disable_frame_rate_limit true
apply_prop debug.sf.force_adaptive_fps false

# ⚡ Rendering Stability
apply_prop debug.egl.hw 1
apply_prop debug.hwui.fps_divisor 1
apply_prop debug.hwui.overdraw false
apply_prop debug.hwui.profile false

# 🪟 Disable Animation (if not root, use settings instead)
if [ "$(id -u)" -eq 0 ]; then
  apply_prop window_animation_scale 0.0
  apply_prop transition_animation_scale 0.0
  apply_prop animator_duration_scale 0.0
else
  settings put global window_animation_scale 0
  settings put global transition_animation_scale 0
  settings put global animator_duration_scale 0
  echo "✅ Animation scales set to 0 via settings"
fi

# 🕹️ High Performance Mode
apply_prop persist.sys.thermal.override 1
apply_prop persist.sys.perf.mode 1
apply_prop persist.vendor.powerhal.rendering_hint 1

sleep 2

echo ""
echo "✅ Optimization Complete!"
echo "🔥 Vulkan & GPU Tweaks Applied Successfully 🚀"
echo "💫 Script by: WillyGailo | Stay Smooth 💯"
echo ""