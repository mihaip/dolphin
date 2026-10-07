// Copyright 2014 Dolphin Emulator Project
// SPDX-License-Identifier: GPL-2.0-or-later

// Stub implementation of the Host_* callbacks for tests. These implementations
// provide defaults, plus a stop callback for the CPU benchmark.

#include <string>
#include <vector>

#include "Core/Host.h"
#include "Core/PowerPC/PowerPC.h"
#include "Core/System.h"

std::vector<std::string> Host_GetPreferredLocales()
{
  return {};
}
void Host_PPCSymbolsChanged()
{
}
void Host_PPCBreakpointsChanged()
{
}
void Host_Message(HostMessageID id)
{
  if (id == HostMessageID::WMUserStop)
  {
    // HBReload stops the CPU. End the plain interpreter's current timing slice
    // as well, since its inner loop runs until downcount is exhausted.
    Core::System::GetInstance().GetPPCState().downcount = 0;
  }
}
void Host_UpdateTitle(const std::string&)
{
}
void Host_UpdateDiscordClientID(const std::string& client_id)
{
}
bool Host_UpdateDiscordPresenceRaw(const std::string& details, const std::string& state,
                                   const std::string& large_image_key,
                                   const std::string& large_image_text,
                                   const std::string& small_image_key,
                                   const std::string& small_image_text,
                                   const int64_t start_timestamp, const int64_t end_timestamp,
                                   const int party_size, const int party_max)
{
  return false;
}
void Host_UpdateDisasmDialog()
{
}
void Host_JitCacheInvalidation()
{
}
void Host_JitProfileDataWiped()
{
}
void Host_RequestRenderWindowSize(int, int)
{
}
bool Host_UIBlocksControllerState()
{
  return false;
}
bool Host_RendererHasFocus()
{
  return false;
}
bool Host_RendererHasFullFocus()
{
  return false;
}
bool Host_RendererIsFullscreen()
{
  return false;
}
bool Host_TASInputHasFocus()
{
  return false;
}
void Host_YieldToUI()
{
}
void Host_TitleChanged()
{
}
std::unique_ptr<GBAHostInterface> Host_CreateGBAHost(std::weak_ptr<HW::GBA::Core> core)
{
  return nullptr;
}
