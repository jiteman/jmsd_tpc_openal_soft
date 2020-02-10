cmake_minimum_required( VERSION 3.7.1 )

project( tpc_openal C CXX )


JMSD_SHOW_PROJECT_HEADER()


include( ${JMSD_COMPONENT_CMAKE_SETTINGS_PATH}/tpc-openal-lib-set-compiler-settings.cmake )
set( JMSD_THIS_PROJECT_SOURCE_ROOT ${JMSD_COMPONENT_SOURCE_ROOT_PATH}/include )

## include dependencies
set( ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR
	${JMSD_PLATFORM_SOURCES}
	${tpc_sdl_DEPENDENCY_DIRS}
	${JMSD_THIS_PROJECT_SOURCE_ROOT} )
list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR )
include_directories( ${${PROJECT_NAME}_DEPENDENCY_DIRS_VAR} )

include_directories(
	${JMSD_COMPONENT_SOURCE_ROOT_PATH}/jmsd_adhocs/version
	${JMSD_COMPONENT_SOURCE_ROOT_PATH}/al
	${JMSD_COMPONENT_SOURCE_ROOT_PATH}/alc
	${JMSD_COMPONENT_SOURCE_ROOT_PATH}/common
	${JMSD_COMPONENT_SOURCE_ROOT_PATH}/jmsd_adhocs/generated
	)

if( UNIX )
	include_directories( ${JMSD_COMPONENT_SOURCE_ROOT_PATH}/jmsd_adhocs/config/linux )
	include_directories( ${JMSD_COMPONENT_SOURCE_ROOT_PATH}/jmsd_adhocs/platform/linux )
elseif( WIN32 )
	include_directories( ${JMSD_COMPONENT_SOURCE_ROOT_PATH}/jmsd_adhocs/config/windows )
	include_directories( ${JMSD_COMPONENT_SOURCE_ROOT_PATH}/jmsd_adhocs/platform/windows )
endif()


## this project headers and sources enumeration section
file( GLOB_RECURSE header_and_source_files
	${JMSD_COMPONENT_SOURCE_ROOT_PATH}/al/*.h*
	${JMSD_COMPONENT_SOURCE_ROOT_PATH}/al/*.c*
	${JMSD_COMPONENT_SOURCE_ROOT_PATH}/alc/*.h*
	${JMSD_COMPONENT_SOURCE_ROOT_PATH}/alc/*.c*
	${JMSD_COMPONENT_SOURCE_ROOT_PATH}/common/*.h*
	${JMSD_COMPONENT_SOURCE_ROOT_PATH}/common/*.c*
	${JMSD_COMPONENT_SOURCE_ROOT_PATH}/router/*.h*
	${JMSD_COMPONENT_SOURCE_ROOT_PATH}/router/*.c*
	${JMSD_COMPONENT_SOURCE_ROOT_PATH}/jmsd_adhocs/config/*.h*
	${JMSD_COMPONENT_SOURCE_ROOT_PATH}/jmsd_adhocs/config/*.c*
	${JMSD_COMPONENT_SOURCE_ROOT_PATH}/jmsd_adhocs/generated/*.h*
	${JMSD_COMPONENT_SOURCE_ROOT_PATH}/jmsd_adhocs/generated/*.c*
	${JMSD_COMPONENT_SOURCE_ROOT_PATH}/jmsd_adhocs/version/*.h*
	${JMSD_COMPONENT_SOURCE_ROOT_PATH}/jmsd_adhocs/version/*.c*
	${JMSD_COMPONENT_SOURCE_ROOT_PATH}/jmsd_adhocs/platform/*.h*
	${JMSD_COMPONENT_SOURCE_ROOT_PATH}/jmsd_adhocs/platform/*.c*
	)

set( JMSD_THIS_PROJECT_FILES_TO_REMOVE
	"alsa.cpp"
	"alsa.h"
	"coreaudio.cpp"
	"coreaudio.h"
	"dsound.cpp"
	"dsound.h"
	"jack.cpp"
	"jack.h"
	"mixer_neon.cpp"
	"mixer_sse.cpp"
	"mixer_sse2.cpp"
	"mixer_sse3.cpp"
	"mixer_sse4.cpp"
	"opensl.cpp"
	"opensl.h"
	"oss.cpp"
	"oss.h"
	"portaudio.cpp"
	"portaudio.h"
	"pulseaudio.cpp"
	"pulseaudio.h"
	"qsa.cpp"
	"qsa.h"
	"sdl2.cpp"
	"sdl2.h"
	"sndio.cpp"
	"sndio.h"
	"solaris.cpp"
	"solaris.h"
	"wasapi.cpp"
	"wasapi.h"
	"wave.cpp"
	"wave.h"
	"winmm.cpp"
	"winmm.h"
	"router" )

if( UNIX )
	set( JMSD_THIS_PROJECT_FILES_TO_KEEP_LINUX
		"alsa.cpp"
		"alsa.h"
		"coreaudio.cpp"
		"coreaudio.h"
		"dsound.cpp"
		"dsound.h"
		"jack.cpp"
		"jack.h"
		"mixer_sse.cpp"
		"mixer_sse2.cpp"
		"mixer_sse3.cpp"
		"mixer_sse4.cpp"
		"opensl.cpp"
		"opensl.h"
		"oss.cpp"
		"oss.h"
		"portaudio.cpp"
		"portaudio.h"
		"pulseaudio.cpp"
		"pulseaudio.h"
		"qsa.cpp"
		"qsa.h"
		"sdl2.cpp"
		"sdl2.h"
		"sndio.cpp"
		"sndio.h"
		"solaris.cpp"
		"solaris.h"
		"wasapi.cpp"
		"wasapi.h"
		"wave.cpp"
		"wave.h"
		"winmm.cpp"
		"winmm.h" )
	JMSD_REMOVE_FILES_FROM_THE_LIST( JMSD_THIS_PROJECT_FILES_TO_REMOVE JMSD_THIS_PROJECT_FILES_TO_KEEP_LINUX )
elseif( WIN32 )
	set( JMSD_THIS_PROJECT_FILES_TO_KEEP_WINDOWS
		"dsound.cpp"
		"dsound.h"
		"mixer_sse.cpp"
		"mixer_sse2.cpp"
		"mixer_sse3.cpp"
		"mixer_sse4.cpp"
		"sdl2.cpp"
		"sdl2.h"
		"wasapi.cpp"
		"wasapi.h"
		"wave.cpp"
		"wave.h"
		"winmm.cpp"
		"winmm.h" )

	JMSD_REMOVE_FILES_FROM_THE_LIST( JMSD_THIS_PROJECT_FILES_TO_REMOVE JMSD_THIS_PROJECT_FILES_TO_KEEP_WINDOWS )
endif()

JMSD_REMOVE_FILES_FROM_THE_LIST( header_and_source_files JMSD_THIS_PROJECT_FILES_TO_REMOVE )

add_library( ${PROJECT_NAME} SHARED ${header_and_source_files} )


## definition section
set( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR
	-DJMSD_OPENAL_SHARED_INTERFACE_INTERNAL
	-DAL_ALEXT_PROTOTYPES
	${tpc_sdl_LINK_DEFINITIONS} )
JMSD_LIST_TO_STRING( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
JMSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
set( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR
	${tpc_sdl_LINK_DEFINITIONS} )
JMSD_LIST_TO_STRING( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
JMSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
add_definitions( "${${PROJECT_NAME}_BUILD_DEFINITIONS_VAR}" )


## required to be able to be linked into shared libraries.
set_target_properties( ${PROJECT_NAME} PROPERTIES POSITION_INDEPENDENT_CODE ON )
set_target_properties( ${PROJECT_NAME} PROPERTIES VERSION 0.1.0 )
set_target_properties( ${PROJECT_NAME} PROPERTIES SOVERSION 0.1 )


## project target section
set( ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR
	${tpc_sdl_DEPENDENCY_LIBS}
	tpc_sdl )

## project target section
if ( UNIX )
	list( APPEND  ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR
		 )
elseif( WIN32 )
	list( APPEND ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR
		"Winmm.lib" )
endif()

list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR )
target_link_libraries( ${PROJECT_NAME} ${${PROJECT_NAME}_DEPENDENCY_LIBS_VAR} )


## Expose public includes to other subprojects through cache variable.
include( ${JMSD_CMAKE_SETTINGS_PATH}/set-expose-dependencies.cmake )
JMSD_SHOW_PROJECT_FOOTER()
