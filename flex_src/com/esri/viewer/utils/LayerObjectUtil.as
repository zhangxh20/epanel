///////////////////////////////////////////////////////////////////////////
// Copyright (c) 2012 Esri. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
///////////////////////////////////////////////////////////////////////////
package com.esri.viewer.utils
{

import com.esri.ags.clusterers.ESRIClusterer;
import com.esri.ags.layers.Layer;

public class LayerObjectUtil
{
    public static function getLayerObject(obj:XML, num:Number, isOpLayer:Boolean, bingKey:String, layer:Layer = null):Object
    {
        var label:String = isOpLayer ? 'OpLayer ' + num : 'Map ' + num; // default label
        if (obj.@label[0]) // check that label attribute exist
        {
            label = obj.@label; // set basemap label if specified in configuration file
        }

        var type:String;
        if (!isOpLayer)
        {
            type = "tiled"; // default basemap type
        }
        if (obj.@type[0]) // check that type attribute exist
        {
            type = obj.@type; // set basemap type if specified in configuration file
        }

        // wms
        var wkid:String;
        if (obj.@wkid[0])
        {
            wkid = obj.@wkid;
        }

        var visible:Boolean = obj.@visible == "true";

        var alpha:Number = 1.0;
        if (obj.@alpha[0])
        {
            if (!isNaN(parseFloat(obj.@alpha)))
            {
                alpha = parseFloat(obj.@alpha);
            }
        }

        var maxAllowableOffset:Number;
        if (obj.@maxallowableoffset[0])
        {
            if (!isNaN(parseFloat(obj.@maxallowableoffset)))
            {
                maxAllowableOffset = parseFloat(obj.@maxallowableoffset);
            }
        }

        var minScale:Number;
        if (obj.@minscale[0])
        {
            if (!isNaN(parseFloat(obj.@minscale)))
            {
                minScale = parseFloat(obj.@minscale);
            }
        }

        var maxScale:Number;
        if (obj.@maxscale[0])
        {
            if (!isNaN(parseFloat(obj.@maxscale)))
            {
                maxScale = parseFloat(obj.@maxscale);
            }
        }

        var maxImageWidth:Number;
        if (obj.@maximagewidth[0])
        {
            if (!isNaN(parseInt(obj.@maximagewidth)))
            {
                maxImageWidth = parseInt(obj.@maximagewidth);
            }
        }

        var maxImageHeight:Number;
        if (obj.@maximageheight[0])
        {
            if (!isNaN(parseInt(obj.@maximageheight)))
            {
                maxImageHeight = parseInt(obj.@maximageheight);
            }
        }

        var noData:Number;
        if (obj.@nodata[0])
        {
            if (!isNaN(parseFloat(obj.@nodata)))
            {
                noData = parseFloat(obj.@nodata);
            }
        }

        var autoRefresh:Number = 0;
        if (obj.@autorefresh[0])
        {
            if (!isNaN(parseInt(obj.@autorefresh)))
            {
                autoRefresh = parseInt(obj.@autorefresh);
            }
        }

        var clustererParser:ClustererParser = new ClustererParser();
        var clusterer:ESRIClusterer = clustererParser.parseClusterer(obj.clustering[0]);
        var useProxy:Boolean = obj.@useproxy[0] && obj.@useproxy == "true"; // default false
        var useMapTime:Boolean = obj.@usemaptime[0] ? obj.@usemaptime == "true" : true; // default true
        var useAMF:String = obj.@useamf[0] ? obj.@useamf : "";
        var token:String = obj.@token[0] ? obj.@token : "";
        var mode:String = obj.@mode[0] ? obj.@mode : "";
        var icon:String = isSupportedImageType(obj.@icon[0]) ? obj.@icon : 'assets/images/defaultBasemapIcon.png';
        var layerId:String = obj.@layerid[0];
        var imageFormat:String = obj.@imageformat;
        var visibleLayers:String = obj.@visiblelayers;
        var displayLevels:String = obj.@displaylevels;
        var bandIds:String = obj.@bandids;
        var skipGetCapabilities:String = obj.@skipgetcapabilities[0];
        var version:String = obj.@version[0];
        var url:String = obj.@url;
        var serviceURL:String = obj.@serviceurl[0];
        var serviceMode:String = obj.@servicemode[0];
        var username:String = obj.@username;
        var password:String = obj.@password;

        // ve tiled layer
        var style:String = obj.@style[0] ? obj.@style : "";
        var key:String;
        if (bingKey)
        {
            key = bingKey;
        }
        else
        {
            key = obj.@key[0] ? obj.@key : "";
        }
        var culture:String = obj.@culture[0] ? obj.@culture : "";

        // arcims layer
        var serviceHost:String = obj.@servicehost[0] ? obj.@servicehost : "";
        var serviceName:String = obj.@servicename[0] ? obj.@servicename : "";

        // definitionExpression for featurelayer
        var definitionExpression:String = obj.@definitionexpression[0] ? obj.@definitionexpression : "";
        var gdbVersion:String = obj.@gdbversion[0];

        //sublayers
        var subLayers:Array = [];
        if (type == "tiled" || type == "dynamic")
        {
            var subLayersList:XMLList = obj.sublayer;
            for (var i:int = 0; i < subLayersList.length(); i++)
            {
                subLayers.push({ id: String(subLayersList[i].@id), info: subLayersList[i].@info, infoConfig: subLayersList[i].@infoconfig, popUpConfig: subLayersList[i].@popupconfig, definitionExpression: String(subLayersList[i].@definitionexpression)});
            }
        }

        var resultObject:Object =
            {
                id: String(num),
                alpha: alpha,
                bandIds: bandIds,
                autoRefresh: autoRefresh,
                culture: culture,
                clusterer: clusterer,
                definitionExpression: definitionExpression,
                displayLevels: displayLevels,
                gdbVersion: gdbVersion,
                icon: icon,
                imageFormat: imageFormat,
                key: key,
                label: label,
                layerId: layerId,
                maxAllowableOffset: maxAllowableOffset,
                maxImageHeight: maxImageHeight,
                maxImageWidth: maxImageWidth,
                minScale: minScale,
                maxScale: maxScale,
                mode: mode,
                noData: noData,
                password: password,
                serviceHost: serviceHost,
                serviceName: serviceName,
                serviceMode: serviceMode,
                serviceURL: serviceURL,
                skipGetCapabilities: skipGetCapabilities,
                style: style,
                subLayers: subLayers,
                token: token,
                type: type,
                url: url,
                useAMF: useAMF,
                useMapTime: useMapTime,
                useProxy: useProxy,
                username: username,
                version: version,
                visible: visible,
                visibleLayers: visibleLayers,
                wkid: wkid
            };

        // look for info, infoconfig and popupconfig on basemaps and operational layers
        var opLayerInfo:String = obj.@info;
        var opLayerInfoConfig:String = obj.@infoconfig;
        var opLayerPopUpConfig:String = obj.@popupconfig;
        resultObject.popUpConfig = opLayerPopUpConfig;
        resultObject.infoConfig = opLayerInfoConfig;
        resultObject.infoUrl = opLayerInfo;
        resultObject.layer = layer;
        if (!isOpLayer)
        {
            var reference:Boolean = obj.@reference[0] && obj.@reference == "true";
            resultObject.reference = reference;
        }

        return resultObject;
    }

    private static function isSupportedImageType(filePath:String):Boolean
    {
        var fp:String = filePath;
        if (!fp)
        {
            return false;
        }
        var tokenIndex:int = fp.indexOf("?");
        var hasToken:Boolean = (tokenIndex > -1);
        fp = hasToken ? fp.substr(0, tokenIndex) : fp;
        var endsWithSupportedImageFileType:RegExp = /\.(png|gif|jpg)$/i;
        return endsWithSupportedImageFileType.test(fp);
    }
}
}
