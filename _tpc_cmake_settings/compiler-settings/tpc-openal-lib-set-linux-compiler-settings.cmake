JMSD_CMAKE_CURRENT_FILE_IN( "${JMSD_FOREIGN_COMPONENT_FULL_NAME}-linux-compiler-settings.cmake" )

if ( UNIX )
	# C
	##set( ${PROJECT_NAME}_C_FLAGS ${CMAKE_C_FLAGS} )
	##set( ${PROJECT_NAME}_C_FLAGS_DEBUG ${CMAKE_C_FLAGS_DEBUG} )
	##set( ${PROJECT_NAME}_C_FLAGS_RELEASE ${CMAKE_C_FLAGS_RELEASE} )

	## list( APPEND ${PROJECT_NAME}_C_FLAGS "-Wno-" ) #

	##string( REPLACE ";" " " ${PROJECT_NAME}_C_FLAGS_STR "${${PROJECT_NAME}_C_FLAGS}" )
	##string( REPLACE ";" " " ${PROJECT_NAME}_C_FLAGS_STR_DEBUG  "${${PROJECT_NAME}_C_FLAGS_DEBUG }" )
	##string( REPLACE ";" " " ${PROJECT_NAME}_C_FLAGS_STR_RELEASE "${${PROJECT_NAME}_C_FLAGS_RELEASE}" )

	## string( REPLACE "-W" "" ${PROJECT_NAME}_C_FLAGS_STR "${${PROJECT_NAME}_C_FLAGS_STR}" ) #

	##set( CMAKE_C_FLAGS ${${PROJECT_NAME}_C_FLAGS_STR} )
	##set( CMAKE_C_FLAGS_DEBUG ${${PROJECT_NAME}_C_FLAGS_STR_DEBUG} )
	##set( CMAKE_C_FLAGS_RELEASE ${${PROJECT_NAME}_C_FLAGS_STR_RELEASE} )

	# C++
	set( ${PROJECT_NAME}_CXX_FLAGS ${CMAKE_CXX_FLAGS} )
	##set( ${PROJECT_NAME}_CXX_FLAGS_DEBUG ${CMAKE_CXX_FLAGS_DEBUG} )
	set( ${PROJECT_NAME}_CXX_FLAGS_RELEASE ${CMAKE_CXX_FLAGS_RELEASE} )

	## list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-" ) #
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-missing-declarations" ) # no previous declaration for ''
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-float-equal" ) # comparing floating point with == or != is unsafe
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-undef" ) # "" is not defined, evaluates to 0
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-unused-function" ) # '' defined but not used

	list( APPEND ${PROJECT_NAME}_CXX_FLAGS_RELEASE "-Wno-inline" ) # inlining failed in call to '' call is unlikely and code size would grow
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS_RELEASE "-msse4.1" ) #

	string( REPLACE ";" " " ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS}" )
	##string( REPLACE ";" " " ${PROJECT_NAME}_CXX_FLAGS_STR_DEBUG "${${PROJECT_NAME}_CXX_FLAGS_DEBUG}" )
	string( REPLACE ";" " " ${PROJECT_NAME}_CXX_FLAGS_STR_RELEASE "${${PROJECT_NAME}_CXX_FLAGS_RELEASE}" )

	## string( REPLACE "-W" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) #

	set( CMAKE_CXX_FLAGS ${${PROJECT_NAME}_CXX_FLAGS_STR} )
	##set( CMAKE_CXX_FLAGS_DEBUG ${${PROJECT_NAME}_CXX_FLAGS_STR_DEBUG} )
	set( CMAKE_CXX_FLAGS_RELEASE ${${PROJECT_NAME}_CXX_FLAGS_STR_RELEASE} )
else()
	message( SEND_ERROR "[JMSD] ${JMSD_FOREIGN_COMPONENT_FULL_NAME} COMPILER SETTINGS: ${JMSD_FOREIGN_COMPONENT_FULL_NAME}-linux-compiler-settings.cmake is included while not on linux" )

endif()

JMSD_CMAKE_CURRENT_FILE_OUT( "${JMSD_FOREIGN_COMPONENT_FULL_NAME}-linux-compiler-settings.cmake" )
