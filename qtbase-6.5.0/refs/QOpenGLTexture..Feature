<def f='qtbase-6.5.0/src/opengl/qopengltexture.h' l='347' ll='367'/>
<use f='qtbase-6.5.0/src/opengl/qopengltexture.h' l='368'/>
<use f='qtbase-6.5.0/src/opengl/qopengltexture.h' l='369' c='_Z20qt_getEnumMetaObjectN14QOpenGLTexture7FeatureE'/>
<use f='qtbase-6.5.0/src/opengl/qopengltexture.h' l='369' c='_Z14qt_getEnumNameN14QOpenGLTexture7FeatureE'/>
<use f='qtbase-6.5.0/src/opengl/qopengltexture.h' l='481' c='_ZN14QOpenGLTexture10hasFeatureENS_7FeatureE'/>
<doc f='qtbase-6.5.0/src/opengl/qopengltexture.h' l='346'>// Features</doc>
<use f='qtbase-6.5.0/src/opengl/qopengltexture.cpp' l='142' c='_ZN21QOpenGLTexturePrivate6createEv'/>
<use f='qtbase-6.5.0/src/opengl/qopengltexture.cpp' l='146' c='_ZN21QOpenGLTexturePrivate6createEv'/>
<use f='qtbase-6.5.0/src/opengl/qopengltexture.cpp' l='3724' c='_ZN14QOpenGLTexture10hasFeatureENS_7FeatureE'/>
<doc f='qtbase-6.5.0/src/opengl/qopengltexture.cpp' l='2370'>/*!
    \enum QOpenGLTexture::Feature
    This enum defines the OpenGL texture-related features that can be tested for.

    \value ImmutableStorage Support for immutable texture storage
    \value ImmutableMultisampleStorage Support for immutable texture storage with
           multisample targets
    \value TextureRectangle Support for the GL_TEXTURE_RECTANGLE target
    \value TextureArrays Support for texture targets with array layers
    \value Texture3D Support for the 3 dimensional texture target
    \value TextureMultisample Support for texture targets that have multisample capabilities
    \value TextureBuffer Support for textures that use OpenGL buffer objects
           as their data source
    \value TextureCubeMapArrays Support for cubemap array texture target
    \value Swizzle Support for texture component swizzle masks
    \value StencilTexturing Support for stencil texturing (i.e. looking up depth or stencil
           components of a combined depth/stencil format texture in GLSL shaders).
    \value AnisotropicFiltering Support for anisotropic texture filtering
    \value NPOTTextures Basic support for non-power-of-two textures
    \value NPOTTextureRepeat Full support for non-power-of-two textures including texture
           repeat modes
    \value Texture1D Support for the 1 dimensional texture target
    \value TextureComparisonOperators Support for texture comparison operators
    \value TextureMipMapLevel Support for setting the base and maximum mipmap levels
*/</doc>
