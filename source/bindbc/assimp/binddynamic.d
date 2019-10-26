module bindbc.assimp.binddynamic;

version(BindAssimp_Static) {}
else version = BindAssimp_Dynamic;

version(BindAssimp_Dynamic):

import bindbc.loader;
import bindbc.assimp.types;

extern(System) @nogc nothrow {
    alias p_aiGetExportFormatCount =     size_t function();
    alias p_aiGetExportFormatDescription =     const(aiExportFormatDesc*) function( size_t pIndex);
    alias p_aiReleaseExportFormatDescription =     void function( const aiExportFormatDesc *desc );
    alias p_aiCopyScene =     void function(const aiScene* pIn, aiScene** pOut);
    alias p_aiFreeScene =     void function(const aiScene* pIn);
    alias p_aiExportScene =     aiReturn function( const aiScene* pScene,
            const char* pFormatId,
            const char* pFileName,
            uint pPreprocessing);
    alias p_aiExportSceneEx =     aiReturn function( const aiScene* pScene,
            const char* pFormatId,
            const char* pFileName,
            aiFileIO* pIO,
            uint pPreprocessing );
    alias p_aiExportSceneToBlob =     const(aiExportDataBlob*) function( const aiScene* pScene, const char* pFormatId,
            uint pPreprocessing );
    alias p_aiReleaseExportBlob =     void function( const aiExportDataBlob* pData );
    alias p_aiImportFile =     const(aiScene*) function(
            const char* pFile,
            uint pFlags);
    alias p_aiImportFileEx =     const(aiScene*) function(
            const char* pFile,
            uint pFlags,
            aiFileIO* pFS);
    alias p_aiImportFileExWithProperties =     const(aiScene*) function(
            const char* pFile,
            uint pFlags,
            aiFileIO* pFS,
            const aiPropertyStore* pProps);
    alias p_aiImportFileFromMemory =     const(aiScene*) function(
            const char* pBuffer,
            uint pLength,
            uint pFlags,
            const char* pHint);
    alias p_aiImportFileFromMemoryWithProperties =     const(aiScene*) function(
            const char* pBuffer,
            uint pLength,
            uint pFlags,
            const char* pHint,
            const aiPropertyStore* pProps);
    alias p_aiApplyPostProcessing =     const(aiScene*) function(
            const aiScene* pScene,
            uint pFlags);
    alias p_aiGetPredefinedLogStream =     aiLogStream function(
            aiDefaultLogStream pStreams,
            const char* file);
    alias p_aiAttachLogStream =     void function(
            const aiLogStream* stream);
    alias p_aiEnableVerboseLogging =     void function(aiBool d);
    alias p_aiDetachLogStream =     aiReturn function(
            const aiLogStream* stream);
    alias p_aiDetachAllLogStreams =     void function();
    alias p_aiReleaseImport =     void function(
            const aiScene* pScene);
    alias p_aiGetErrorString =     const(char*) function();
    alias p_aiIsExtensionSupported =     aiBool function(
            const char* szExtension);
    alias p_aiGetExtensionList =     void function(
            aiString* szOut);
    alias p_aiGetMemoryRequirements =     void function(
            const aiScene* pIn,
            aiMemoryInfo* _in);
    alias p_aiCreatePropertyStore =     aiPropertyStore* function();
    alias p_aiReleasePropertyStore =     void function(aiPropertyStore* p);
    alias p_aiSetImportPropertyInteger =     void function(
            aiPropertyStore* store,
            const char* szName,
            int value);
    alias p_aiSetImportPropertyFloat =     void function(
            aiPropertyStore* store,
            const char* szName,
            ai_real value);
    alias p_aiSetImportPropertyString =     void function(
            aiPropertyStore* store,
            const char* szName,
            const aiString* st);
    alias p_aiSetImportPropertyMatrix =     void function(
            aiPropertyStore* store,
            const char* szName,
            const aiMatrix4x4* mat);
    alias p_aiCreateQuaternionFromMatrix =     void function(
            aiQuaternion* quat,
            const aiMatrix3x3* mat);
    alias p_aiDecomposeMatrix =     void function(
            const aiMatrix4x4* mat,
            aiVector3D* scaling,
            aiQuaternion* rotation,
            aiVector3D* position);
    alias p_aiTransposeMatrix4 =     void function(
            aiMatrix4x4* mat);
    alias p_aiTransposeMatrix3 =     void function(
            aiMatrix3x3* mat);
    alias p_aiTransformVecByMatrix3 =     void function(
            aiVector3D* vec,
            const aiMatrix3x3* mat);
    alias p_aiTransformVecByMatrix4 =     void function(
            aiVector3D* vec,
            const aiMatrix4x4* mat);
    alias p_aiMultiplyMatrix4 =     void function(
            aiMatrix4x4* dst,
            const aiMatrix4x4* src);
    alias p_aiMultiplyMatrix3 =     void function(
            aiMatrix3x3* dst,
            const aiMatrix3x3* src);
    alias p_aiIdentityMatrix3 =     void function(
            aiMatrix3x3* mat);
    alias p_aiIdentityMatrix4 =     void function(
            aiMatrix4x4* mat);
    alias p_aiGetImportFormatCount =     size_t function();
    alias p_aiGetImportFormatDescription =     const(aiImporterDesc*) function( size_t pIndex);
    alias p_aiGetImporterDesc =     const(aiImporterDesc*) function( const char *extension );
    alias p_aiGetMaterialProperty =     aiReturn function(
            const aiMaterial* pMat,
            const char* pKey,
            uint type,
            uint index,
            const aiMaterialProperty** pPropOut);
    alias p_aiGetMaterialFloatArray =     aiReturn function(
            const aiMaterial* pMat,
            const char* pKey,
            uint type,
            uint index,
            ai_real* pOut,
            uint* pMax);
    alias p_aiGetMaterialIntegerArray =     aiReturn function(const aiMaterial* pMat,
            const char* pKey,
            uint  type,
            uint  index,
            int* pOut,
            uint* pMax);
    alias p_aiGetMaterialColor =     aiReturn function(const aiMaterial* pMat,
        const char* pKey,
        uint type,
        uint index,
        aiColor4D* pOut);
    alias p_aiGetMaterialUVTransform =     aiReturn function(const aiMaterial* pMat,
        const char* pKey,
        uint type,
        uint index,
        aiUVTransform* pOut);
    alias p_aiGetMaterialString =     aiReturn function(const aiMaterial* pMat,
            const char* pKey,
            uint type,
            uint index,
            aiString* pOut);
    alias p_aiGetMaterialTextureCount =     uint function(const aiMaterial* pMat,
            aiTextureType type);
    alias p_aiGetMaterialTexture =     aiReturn function(const aiMaterial* mat,
            aiTextureType type,
            uint  index,
            aiString* path,
            aiTextureMapping* mapping,
            uint* uvindex,
            ai_real* blend,
            aiTextureOp* op,
            aiTextureMapMode* mapmode,
            uint* flags);
    alias p_aiGetLegalString = const(char*) function();
    alias p_aiGetVersionMinor = uint function();
    alias p_aiGetVersionMajor = uint function();
    alias p_aiGetVersionRevision = uint function();
    alias p_aiGetBranchName = const(char*) function();
    alias p_aiGetCompileFlags = uint function();
}

__gshared {
    p_aiGetExportFormatCount aiGetExportFormatCount;
    p_aiGetExportFormatDescription aiGetExportFormatDescription;
    p_aiReleaseExportFormatDescription aiReleaseExportFormatDescription;
    p_aiCopyScene aiCopyScene;
    p_aiFreeScene aiFreeScene;
    p_aiExportScene aiExportScene;
    p_aiExportSceneEx aiExportSceneEx;
    p_aiExportSceneToBlob aiExportSceneToBlob;
    p_aiReleaseExportBlob aiReleaseExportBlob;
    p_aiImportFile aiImportFile;
    p_aiImportFileEx aiImportFileEx;
    p_aiImportFileExWithProperties aiImportFileExWithProperties;
    p_aiImportFileFromMemory aiImportFileFromMemory;
    p_aiImportFileFromMemoryWithProperties aiImportFileFromMemoryWithProperties;
    p_aiApplyPostProcessing aiApplyPostProcessing;
    p_aiGetPredefinedLogStream aiGetPredefinedLogStream;
    p_aiAttachLogStream aiAttachLogStream;
    p_aiEnableVerboseLogging aiEnableVerboseLogging;
    p_aiDetachLogStream aiDetachLogStream;
    p_aiDetachAllLogStreams aiDetachAllLogStreams;
    p_aiReleaseImport aiReleaseImport;
    p_aiGetErrorString aiGetErrorString;
    p_aiIsExtensionSupported aiIsExtensionSupported;
    p_aiGetExtensionList aiGetExtensionList;
    p_aiGetMemoryRequirements aiGetMemoryRequirements;
    p_aiCreatePropertyStore aiCreatePropertyStore;
    p_aiReleasePropertyStore aiReleasePropertyStore;
    p_aiSetImportPropertyInteger aiSetImportPropertyInteger;
    p_aiSetImportPropertyFloat aiSetImportPropertyFloat;
    p_aiSetImportPropertyString aiSetImportPropertyString;
    p_aiSetImportPropertyMatrix aiSetImportPropertyMatrix;
    p_aiCreateQuaternionFromMatrix aiCreateQuaternionFromMatrix;
    p_aiDecomposeMatrix aiDecomposeMatrix;
    p_aiTransposeMatrix4 aiTransposeMatrix4;
    p_aiTransposeMatrix3 aiTransposeMatrix3;
    p_aiTransformVecByMatrix3 aiTransformVecByMatrix3;
    p_aiTransformVecByMatrix4 aiTransformVecByMatrix4;
    p_aiMultiplyMatrix4 aiMultiplyMatrix4;
    p_aiMultiplyMatrix3 aiMultiplyMatrix3;
    p_aiIdentityMatrix3 aiIdentityMatrix3;
    p_aiIdentityMatrix4 aiIdentityMatrix4;
    p_aiGetImportFormatCount aiGetImportFormatCount;
    p_aiGetImportFormatDescription aiGetImportFormatDescription;
    p_aiGetImporterDesc aiGetImporterDesc;
    p_aiGetMaterialProperty aiGetMaterialProperty;
    p_aiGetMaterialFloatArray aiGetMaterialFloatArray;
    p_aiGetMaterialIntegerArray aiGetMaterialIntegerArray;
    p_aiGetMaterialColor aiGetMaterialColor;
    p_aiGetMaterialUVTransform aiGetMaterialUVTransform;
    p_aiGetMaterialString aiGetMaterialString;
    p_aiGetMaterialTextureCount aiGetMaterialTextureCount;
    p_aiGetMaterialTexture aiGetMaterialTexture;
    p_aiGetLegalString aiGetLegalString;
    p_aiGetVersionMinor aiGetVersionMinor;
    p_aiGetVersionMajor aiGetVersionMajor;
    p_aiGetVersionRevision aiGetVersionRevision;
    p_aiGetBranchName aiGetBranchName;
    p_aiGetCompileFlags aiGetCompileFlags;
}

private {
    SharedLib lib;
    AssimpSupport loadedVersion;
}

AssimpSupport loadedAssimpVersion() { return loadedVersion; }

bool isAssimpLoaded() { return lib != invalidHandle; }

AssimpSupport loadAssimp()
{
    version(Windows) {
        const(char)[][1] libNames = [
            "Assimp5.dll"
        ];
    }
    else version(OSX) {
        const(char)[][2] libNames = [
            "libassimp.dylib",
            "libassimp.dylib.5"
        ];
    }
    else version(Posix) {
        const(char)[][2] libNames = [
            "libassimp.so",
            "libassimp.so.5"
        ];
    }
    else static assert(0, "bindbc-assimp is not yet supported on this platform.");

    AssimpSupport ret;
    foreach(name; libNames) {
        ret = loadAssimp(name.ptr);
        if(ret != AssimpSupport.noLibrary) break;
    }
    return ret;
}

AssimpSupport loadAssimp(const(char)* libName)
{
    lib = load(libName);
    if(lib == invalidHandle) {
        return AssimpSupport.noLibrary;
    }

    auto errCount = errorCount();
    loadedVersion = AssimpSupport.badLibrary;

    lib.bindSymbol_stdcall(aiGetExportFormatCount, "aiGetExportFormatCount");
    lib.bindSymbol_stdcall(aiGetExportFormatDescription, "aiGetExportFormatDescription");
    lib.bindSymbol_stdcall(aiReleaseExportFormatDescription, "aiReleaseExportFormatDescription");
    lib.bindSymbol_stdcall(aiCopyScene, "aiCopyScene");
    lib.bindSymbol_stdcall(aiFreeScene, "aiFreeScene");
    lib.bindSymbol_stdcall(aiExportScene, "aiExportScene");
    lib.bindSymbol_stdcall(aiExportSceneEx, "aiExportSceneEx");
    lib.bindSymbol_stdcall(aiExportSceneToBlob, "aiExportSceneToBlob");
    lib.bindSymbol_stdcall(aiReleaseExportBlob, "aiReleaseExportBlob");
    lib.bindSymbol_stdcall(aiImportFile, "aiImportFile");
    lib.bindSymbol_stdcall(aiImportFileEx, "aiImportFileEx");
    lib.bindSymbol_stdcall(aiImportFileExWithProperties, "aiImportFileExWithProperties");
    lib.bindSymbol_stdcall(aiImportFileFromMemory, "aiImportFileFromMemory");
    lib.bindSymbol_stdcall(aiImportFileFromMemoryWithProperties, "aiImportFileFromMemoryWithProperties");
    lib.bindSymbol_stdcall(aiApplyPostProcessing, "aiApplyPostProcessing");
    lib.bindSymbol_stdcall(aiGetPredefinedLogStream, "aiGetPredefinedLogStream");
    lib.bindSymbol_stdcall(aiAttachLogStream, "aiAttachLogStream");
    lib.bindSymbol_stdcall(aiEnableVerboseLogging, "aiEnableVerboseLogging");
    lib.bindSymbol_stdcall(aiDetachLogStream, "aiDetachLogStream");
    lib.bindSymbol_stdcall(aiDetachAllLogStreams, "aiDetachAllLogStreams");
    lib.bindSymbol_stdcall(aiReleaseImport, "aiReleaseImport");
    lib.bindSymbol_stdcall(aiGetErrorString, "aiGetErrorString");
    lib.bindSymbol_stdcall(aiIsExtensionSupported, "aiIsExtensionSupported");
    lib.bindSymbol_stdcall(aiGetExtensionList, "aiGetExtensionList");
    lib.bindSymbol_stdcall(aiGetMemoryRequirements, "aiGetMemoryRequirements");
    lib.bindSymbol_stdcall(aiCreatePropertyStore, "aiCreatePropertyStore");
    lib.bindSymbol_stdcall(aiReleasePropertyStore, "aiReleasePropertyStore");
    lib.bindSymbol_stdcall(aiSetImportPropertyInteger, "aiSetImportPropertyInteger");
    lib.bindSymbol_stdcall(aiSetImportPropertyFloat, "aiSetImportPropertyFloat");
    lib.bindSymbol_stdcall(aiSetImportPropertyString, "aiSetImportPropertyString");
    lib.bindSymbol_stdcall(aiSetImportPropertyMatrix, "aiSetImportPropertyMatrix");
    lib.bindSymbol_stdcall(aiCreateQuaternionFromMatrix, "aiCreateQuaternionFromMatrix");
    lib.bindSymbol_stdcall(aiDecomposeMatrix, "aiDecomposeMatrix");
    lib.bindSymbol_stdcall(aiTransposeMatrix4, "aiTransposeMatrix4");
    lib.bindSymbol_stdcall(aiTransposeMatrix3, "aiTransposeMatrix3");
    lib.bindSymbol_stdcall(aiTransformVecByMatrix3, "aiTransformVecByMatrix3");
    lib.bindSymbol_stdcall(aiTransformVecByMatrix4, "aiTransformVecByMatrix4");
    lib.bindSymbol_stdcall(aiMultiplyMatrix4, "aiMultiplyMatrix4");
    lib.bindSymbol_stdcall(aiMultiplyMatrix3, "aiMultiplyMatrix3");
    lib.bindSymbol_stdcall(aiIdentityMatrix3, "aiIdentityMatrix3");
    lib.bindSymbol_stdcall(aiIdentityMatrix4, "aiIdentityMatrix4");
    lib.bindSymbol_stdcall(aiGetImportFormatCount, "aiGetImportFormatCount");
    lib.bindSymbol_stdcall(aiGetImportFormatDescription, "aiGetImportFormatDescription");
    lib.bindSymbol_stdcall(aiGetImporterDesc, "aiGetImporterDesc");
    lib.bindSymbol_stdcall(aiGetMaterialProperty, "aiGetMaterialProperty");
    lib.bindSymbol_stdcall(aiGetMaterialFloatArray, "aiGetMaterialFloatArray");
    lib.bindSymbol_stdcall(aiGetMaterialIntegerArray, "aiGetMaterialIntegerArray");
    lib.bindSymbol_stdcall(aiGetMaterialColor, "aiGetMaterialColor");
    lib.bindSymbol_stdcall(aiGetMaterialUVTransform, "aiGetMaterialUVTransform");
    lib.bindSymbol_stdcall(aiGetMaterialString, "aiGetMaterialString");
    lib.bindSymbol_stdcall(aiGetMaterialTextureCount, "aiGetMaterialTextureCount");
    lib.bindSymbol_stdcall(aiGetMaterialTexture, "aiGetMaterialTexture");
    lib.bindSymbol_stdcall(aiGetLegalString, "aiGetLegalString");
    lib.bindSymbol_stdcall(aiGetVersionMinor, "aiGetVersionMinor");
    lib.bindSymbol_stdcall(aiGetVersionMajor, "aiGetVersionMajor");
    lib.bindSymbol_stdcall(aiGetVersionRevision, "aiGetVersionRevision");
    lib.bindSymbol_stdcall(aiGetBranchName, "aiGetBranchName");
    lib.bindSymbol_stdcall(aiGetCompileFlags, "aiGetCompileFlags");

    if(errorCount() != errCount) return AssimpSupport.badLibrary;
    else loadedVersion = AssimpSupport.assimp500;

    return loadedVersion;
}

aiReturn aiGetMaterialFloat(
        const aiMaterial* pMat,
        const char* pKey,
        uint type,
        uint index,
        ai_real* pOut)
{
    return aiGetMaterialFloatArray(pMat, pKey, type, index, pOut, null);
}

aiReturn aiGetMaterialInteger(const aiMaterial* pMat,
        const char* pKey,
        uint  type,
        uint  index,
        int* pOut)
{
    return aiGetMaterialIntegerArray(pMat, pKey, type, index, pOut, null);
}
