<def f='qtbase-6.5.0/src/network/kernel/qnetworkinformation.h' l='45' ll='50'/>
<use f='qtbase-6.5.0/src/network/kernel/qnetworkinformation.h' l='51'/>
<doc f='qtbase-6.5.0/src/network/kernel/qnetworkinformation.cpp' l='403'>/*!
    \enum QNetworkInformation::Feature

    Lists all of the features that a plugin may currently support.
    This can be used in QNetworkInformation::load().

    \value Reachability
        If the plugin supports this feature then the \c reachability property
        will provide useful results. Otherwise it will always return
        \c{Reachability::Unknown}.
        See also QNetworkInformation::Reachability.

    \value CaptivePortal
        If the plugin supports this feature then the \c isBehindCaptivePortal
        property will provide useful results. Otherwise it will always return
        \c{false}.

    \value TransportMedium
        If the plugin supports this feature then the \c transportMedium
        property will provide useful results. Otherwise it will always return
        \c{TransportMedium::Unknown}.
        See also QNetworkInformation::TransportMedium.

    \value Metered
        If the plugin supports this feature then the \c isMetered
        property will provide useful results. Otherwise it will always return
        \c{false}.
*/</doc>
<use f='qtbase-6.5.0/src/plugins/networkinformation/glib/qglibnetworkinformationbackend.cpp' l='53' c='_ZN30QGlibNetworkInformationBackend23featuresSupportedStaticEv'/>
<use f='qtbase-6.5.0/src/plugins/networkinformation/networkmanager/qnetworkmanagernetworkinformationbackend.cpp' l='124' c='_ZN40QNetworkManagerNetworkInformationBackend23featuresSupportedStaticEv'/>
