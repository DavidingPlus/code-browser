<def f='boost-1.85.0/libs/xpressive/include/boost/xpressive/regex_primitives.hpp' l='496' type='const proto::terminal&lt;detail::self_placeholder&gt;::type'/>
<use f='boost-1.85.0/libs/xpressive/include/boost/xpressive/regex_primitives.hpp' l='900' u='r' c='_ZN5boost9xpressive6detail30ignore_unused_regex_primitivesEv'/>
<doc f='boost-1.85.0/libs/xpressive/include/boost/xpressive/regex_primitives.hpp' l='489'>///////////////////////////////////////////////////////////////////////////////
/// \brief Reference to the current regex object
///
/// Useful when constructing recursive regular expression objects. The &apos;self&apos;
/// identifier is a short-hand for the current regex object. For instance,
/// sregex rx = &apos;(&apos; &gt;&gt; (self | nil) &gt;&gt; &apos;)&apos;; will create a regex object that
/// matches balanced parens such as &quot;((()))&quot;.</doc>
