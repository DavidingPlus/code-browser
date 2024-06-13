<def f='qtbase-6.5.0/src/gui/rhi/qrhi_p.h' l='1650' ll='1688'/>
<use f='qtbase-6.5.0/src/gui/rhi/qrhi_p.h' l='1805' c='_ZNK4QRhi18isFeatureSupportedENS_7FeatureE'/>
<use f='qtbase-6.5.0/src/gui/rhi/qrhi_p_p.h' l='131' c='_ZNK18QRhiImplementation18isFeatureSupportedEN4QRhi7FeatureE'/>
<use f='qtbase-6.5.0/src/gui/rhi/qrhinull_p_p.h' l='272' c='_ZNK8QRhiNull18isFeatureSupportedEN4QRhi7FeatureE'/>
<use f='qtbase-6.5.0/src/gui/rhi/qrhigles2_p_p.h' l='817' c='_ZNK9QRhiGles218isFeatureSupportedEN4QRhi7FeatureE'/>
<use f='qtbase-6.5.0/src/gui/rhi/qrhi.cpp' l='6985' c='_ZNK4QRhi18isFeatureSupportedENS_7FeatureE'/>
<doc f='qtbase-6.5.0/src/gui/rhi/qrhi.cpp' l='474'>/*!
    \enum QRhi::Feature
    Flag values to indicate what features are supported by the backend currently in use.

    \value MultisampleTexture Indicates that textures with a sample count larger
    than 1 are supported. In practice this feature will be unsupported with
    OpenGL ES versions older than 3.1, and OpenGL older than 3.0.

    \value MultisampleRenderBuffer Indicates that renderbuffers with a sample
    count larger than 1 are supported. In practice this feature will be
    unsupported with OpenGL ES 2.0, and may also be unsupported with OpenGL 2.x
    unless the relevant extensions are present.

    \value DebugMarkers Indicates that debug marker groups (and so
    QRhiCommandBuffer::debugMarkBegin()) are supported.

    \value Timestamps Indicates that command buffer timestamps are supported.
    Relevant for addGpuFrameTimeCallback(). Can be expected to be supported on
    D3D11 and Vulkan, assuming the underlying implementation supports it.

    \value Instancing Indicates that instanced drawing is supported. In
    practice this feature will be unsupported with OpenGL ES 2.0 and OpenGL
    3.2 or older.

    \value CustomInstanceStepRate Indicates that instance step rates other
    than 1 are supported. In practice this feature will always be unsupported
    with OpenGL. In addition, running with Vulkan 1.0 without
    VK_EXT_vertex_attribute_divisor will also lead to reporting false for this
    feature.

    \value PrimitiveRestart Indicates that restarting the assembly of
    primitives when encountering an index value of 0xFFFF
    (\l{QRhiCommandBuffer::IndexUInt16}{IndexUInt16}) or 0xFFFFFFFF
    (\l{QRhiCommandBuffer::IndexUInt32}{IndexUInt32}) is enabled, for certain
    primitive topologies at least. QRhi will try to enable this with all
    backends, but in some cases it will not be supported. Dynamically
    controlling primitive restart is not possible since with some APIs
    primitive restart with a fixed index is always on. Applications must assume
    that whenever this feature is reported as supported, the above mentioned
    index values \c may be treated specially, depending on the topology. The
    only two topologies where primitive restart is guaranteed to behave
    identically across backends, as long as this feature is reported as
    supported, are \l{QRhiGraphicsPipeline::LineStrip}{LineStrip} and
    \l{QRhiGraphicsPipeline::TriangleStrip}{TriangleStrip}.

    \value NonDynamicUniformBuffers Indicates that creating buffers with the
    usage \l{QRhiBuffer::UniformBuffer}{UniformBuffer} and the types
    \l{QRhiBuffer::Immutable}{Immutable} or \l{QRhiBuffer::Static}{Static} is
    supported. When reported as unsupported, uniform (constant) buffers must be
    created as \l{QRhiBuffer::Dynamic}{Dynamic}. (which is recommended
    regardless)

    \value NonFourAlignedEffectiveIndexBufferOffset Indicates that effective
    index buffer offsets (\c{indexOffset + firstIndex * indexComponentSize})
    that are not 4 byte aligned are supported. When not supported, attempting
    to issue a \l{QRhiCommandBuffer::drawIndexed()}{drawIndexed()} with a
    non-aligned effective offset may lead to unspecified behavior. Relevant in
    particular for Metal, where this will be reported as unsupported.

    \value NPOTTextureRepeat Indicates that the
    \l{QRhiSampler::Repeat}{Repeat} wrap mode and mipmap filtering modes are
    supported for textures with a non-power-of-two size. In practice this can
    only be false with OpenGL ES 2.0 implementations without
    \c{GL_OES_texture_npot}.

    \value RedOrAlpha8IsRed Indicates that the
    \l{QRhiTexture::RED_OR_ALPHA8}{RED_OR_ALPHA8} format maps to a one
    component 8-bit \c red format. This is the case for all backends except
    OpenGL when using either OpenGL ES or a non-core profile context. There
    \c{GL_ALPHA}, a one component 8-bit \c alpha format, is used
    instead. Using the special texture format allows having a single code
    path for creating textures, leaving it up to the backend to decide the
    actual format, while the feature flag can be used to pick the
    appropriate shader variant for sampling the texture.

    \value ElementIndexUint Indicates that 32-bit unsigned integer elements are
    supported in the index buffer. In practice this is true everywhere except
    when running on plain OpenGL ES 2.0 implementations without the necessary
    extension. When false, only 16-bit unsigned elements are supported in the
    index buffer.

    \value Compute Indicates that compute shaders, image load/store, and
    storage buffers are supported. OpenGL older than 4.3 and OpenGL ES older
    than 3.1 have no compute support.

    \value WideLines Indicates that lines with a width other than 1 are
    supported. When reported as not supported, the line width set on the
    graphics pipeline state is ignored. This can always be false with some
    backends (D3D11, Metal). With Vulkan, the value depends on the
    implementation. With OpenGL, wide lines are not supported in core profile
    contexts.

    \value VertexShaderPointSize Indicates that the size of rasterized points
    set via \c{gl_PointSize} in the vertex shader is taken into account. When
    reported as not supported, drawing points with a size other than 1 is not
    supported. Setting \c{gl_PointSize} in the shader is still valid then, but
    is ignored. (for example, when generating HLSL, the assignment is silently
    dropped from the generated code) Note that some APIs (Metal, Vulkan)
    require the point size to be set in the shader explicitly whenever drawing
    points, even when the size is 1, as they do not automatically default to 1.

    \value BaseVertex Indicates that
    \l{QRhiCommandBuffer::drawIndexed()}{drawIndexed()} supports the \c
    vertexOffset argument. When reported as not supported, the vertexOffset
    value in an indexed draw is ignored. In practice this feature will be
    unsupported with OpenGL and OpenGL ES versions lower than 3.2, and with
    Metal on older iOS devices, including the iOS Simulator.

    \value BaseInstance Indicates that instanced draw commands support the \c
    firstInstance argument. When reported as not supported, the firstInstance
    value is ignored and the instance ID starts from 0. In practice this feature
    will be unsupported with OpenGL, and with Metal on older iOS devices,
    including the iOS Simulator.

    \value TriangleFanTopology Indicates that QRhiGraphicsPipeline::setTopology()
    supports QRhiGraphicsPipeline::TriangleFan. In practice this feature will be
    unsupported with Metal and Direct 3D 11.

    \value ReadBackNonUniformBuffer Indicates that
    \l{QRhiResourceUpdateBatch::readBackBuffer()}{reading buffer contents} is
    supported for QRhiBuffer instances with a usage different than
    UniformBuffer. In practice this feature will be unsupported with OpenGL ES
    2.0.

    \value ReadBackNonBaseMipLevel Indicates that specifying a mip level other
    than 0 is supported when reading back texture contents. When not supported,
    specifying a non-zero level in QRhiReadbackDescription leads to returning
    an all-zero image. In practice this feature will be unsupported with OpenGL
    ES 2.0.

    \value TexelFetch Indicates that texelFetch() and textureLod() are available
    in shaders. In practice this will be reported as unsupported with OpenGL ES
    2.0 and OpenGL 2.x contexts, because GLSL 100 es and versions before 130 do
    not support these functions.

    \value RenderToNonBaseMipLevel Indicates that specifying a mip level other
    than 0 is supported when creating a QRhiTextureRenderTarget with a
    QRhiTexture as its color attachment. When not supported, create() will fail
    whenever the target mip level is not zero. In practice this feature will be
    unsupported with OpenGL ES 2.0.

    \value IntAttributes Indicates that specifying input attributes with
    signed and unsigned integer types for a shader pipeline is supported. When
    not supported, build() will succeed but just show a warning message and the
    values of the target attributes will be broken. In practice this feature
    will be unsupported with OpenGL ES 2.0 and OpenGL 2.x.

    \value ScreenSpaceDerivatives Indicates that functions such as dFdx(),
    dFdy(), and fwidth() are supported in shaders. In practice this feature will
    be unsupported with OpenGL ES 2.0 without the GL_OES_standard_derivatives
    extension.

    \value ReadBackAnyTextureFormat Indicates that reading back texture
    contents can be expected to work for any QRhiTexture::Format. Backends
    other than OpenGL can be expected to return true for this feature. When
    reported as false, which will typically happen with OpenGL, only the
    formats QRhiTexture::RGBA8 and QRhiTexture::BGRA8 are guaranteed to be
    supported for readbacks. In addition, with OpenGL, but not OpenGL ES,
    reading back the 1 byte per component formats QRhiTexture::R8 and
    QRhiTexture::RED_OR_ALPHA8 are supported as well. Reading back floating
    point formats QRhiTexture::RGBA16F and RGBA32F may work too with OpenGL, as
    long as the implementation provides support for these, but QRhi can give no
    guarantees, as indicated by this flag.

    \value PipelineCacheDataLoadSave Indicates that the pipelineCacheData() and
    setPipelineCacheData() functions are functional. When not supported, the
    functions will not perform any action, the retrieved blob is always empty,
    and thus no benefits can be expected from retrieving and, during a
    subsequent run of the application, reloading the pipeline cache content.

    \value ImageDataStride Indicates that specifying a custom stride (row
    length) for raw image data in texture uploads is supported. When not
    supported (which can happen when the underlying API is OpenGL ES 2.0 without
    support for GL_UNPACK_ROW_LENGTH),
    QRhiTextureSubresourceUploadDescription::setDataStride() must not be used.

    \value RenderBufferImport Indicates that QRhiRenderBuffer::createFrom() is
    supported. For most graphics APIs this is not sensible because
    QRhiRenderBuffer encapsulates texture objects internally, just like
    QRhiTexture. With OpenGL however, renderbuffer object exist as a separate
    object type in the API, and in certain environments (for example, where one
    may want to associated a renderbuffer object with an EGLImage object) it is
    important to allow wrapping an existing OpenGL renderbuffer object with a
    QRhiRenderBuffer.

    \value ThreeDimensionalTextures Indicates that 3D textures are supported.
    In practice this feature will be unsupported with OpenGL and OpenGL ES
    versions lower than 3.0.

    \value RenderTo3DTextureSlice Indicates that rendering to a slice in a 3D
    texture is supported. This can be unsupported with Vulkan 1.0 due to
    relying on VK_IMAGE_CREATE_2D_ARRAY_COMPATIBLE_BIT which is a Vulkan 1.1
    feature.

    \value TextureArrays Indicates that texture arrays are supported and
    QRhi::newTextureArray() is functional. Note that even when texture arrays
    are not supported, arrays of textures are still available as those are two
    independent features.

    \value Tessellation Indicates that the tessellation control and evaluation
    stages are supported. When reported as supported, the topology of a
    QRhiGraphicsPipeline can be set to
    \l{QRhiGraphicsPipeline::Patches}{Patches}, the number of control points
    can be set via
    \l{QRhiGraphicsPipeline::setPatchControlPointCount()}{setPatchControlPointCount()},
    and shaders for tessellation control and evaluation can be specified in the
    QRhiShaderStage list. Tessellation shaders have portability issues between
    APIs (for example, translating GLSL/SPIR-V to HLSL is problematic due to
    the way hull shaders are structured, whereas Metal uses a somewhat
    different tessellation pipeline than others), and therefore unexpected
    issues may still arise, even though basic functionality is implemented
    across all the underlying APIs. For Direct 3D in particular, handwritten
    HLSL hull and domain shaders must be injected into each QShader for the
    tessellation control and evaluation stages, respectively, since qsb cannot
    generate these from SPIR-V. Note that isoline tessellation should be
    avoided as it will not be supported by all backends. The maximum patch
    control point count portable between backends is 32.

    \value GeometryShader Indicates that the geometry shader stage is
    supported. When supported, a geometry shader can be specified in the
    QRhiShaderStage list. Geometry Shaders are considered an experimental
    feature in QRhi and can only be expected to be supported with Vulkan,
    Direct 3D, OpenGL (3.2+) and OpenGL ES (3.2+), assuming the implementation
    reports it as supported at run time. Geometry shaders have portability
    issues between APIs, and therefore no guarantees can be given for a
    universal solution. They will never be supported with Metal. Whereas with
    Direct 3D a handwritten HLSL geometry shader must be injected into each
    QShader for the geometry stage since qsb cannot generate this from SPIR-V.

    \value TextureArrayRange Indicates that for
    \l{QRhi::newTextureArray()}{texture arrays} it is possible to specify a
    range that is exposed to the shaders. Normally all array layers are exposed
    and it is up to the shader to select the layer (via the third coordinate
    passed to texture() when sampling the \c sampler2DArray). When supported,
    calling QRhiTexture::setArrayRangeStart() and
    QRhiTexture::setArrayRangeLength() before
    \l{QRhiTexture::create()}{building} or
    \l{QRhiTexture::createFrom()}{importing} the native texture has an effect,
    and leads to selecting only the specified range from the array. This will
    be necessary in special cases, such as when working with accelerated video
    decoding and Direct 3D 11, because a texture array with both
    \c{D3D11_BIND_DECODER} and \c{D3D11_BIND_SHADER_RESOURCE} on it is only
    usable as a shader resource if a single array layer is selected. Note that
    all this is applicable only when the texture is used as a
    QRhiShaderResourceBinding::SampledTexture or
    QRhiShaderResourceBinding::Texture shader resource, and is not compatible
    with image load/store. This feature is only available with some backends as
    it does not map well to all graphics APIs, and it is only meant to provide
    support for special cases anyhow. In practice the feature can be expected to
    be supported with Direct3D 11 and Vulkan.

    \value NonFillPolygonMode Indicates that setting a PolygonMode other than
    the default Fill is supported for QRhiGraphicsPipeline. A common use case
    for changing the mode to Line is to get wireframe rendering. This however
    is not available as a core OpenGL ES feature, and is optional with Vulkan
    as well as some mobile GPUs may not offer the feature.

    \value OneDimensionalTextures Indicates that 1D textures are supported.
    In practice this feature will be unsupported on OpenGL ES.

    \value OneDimensionalTextureMipmaps Indicates that 1D texture mipmaps and
    1D texture render targets are supported. In practice this feature will be
    unsupported on backends that do not report support for
    \l{OneDimensionalTextures}, and Metal.

 */</doc>
<use f='qtbase-6.5.0/src/gui/rhi/qrhigles2.cpp' l='1242' c='_ZNK9QRhiGles218isFeatureSupportedEN4QRhi7FeatureE'/>
<use f='qtbase-6.5.0/src/gui/rhi/qrhinull.cpp' l='99' c='_ZNK8QRhiNull18isFeatureSupportedEN4QRhi7FeatureE'/>
