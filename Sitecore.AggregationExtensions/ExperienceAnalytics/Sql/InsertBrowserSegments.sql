/* This SQL script will bypass the workflow for segment configuration items and also avoid the default 30 minute segment aggregation offset */
  
  INSERT INTO [Segments] ([SegmentId], [DimensionId], [DeployDate], [Status])
  VALUES ('12E04447-DEF0-45EC-A1B5-1D3A817BC14E', 'E5EDAE99-A273-461A-9C06-BD066A83587E', '2015-01-27 00:00:00.000', 0)
  INSERT INTO [Segments] ([SegmentId], [DimensionId], [DeployDate], [Status])
  VALUES ('5A5DAC6C-BCE7-4FB0-8F52-21B09ECE6B5B', '679E880C-D86A-488E-923A-B86476CEE4FF', '2015-01-27 00:00:00.000', 0)
  INSERT INTO [Segments] ([SegmentId], [DimensionId], [DeployDate], [Status])
  VALUES ('71E8391A-508A-4805-9EF4-7DDAD2B37281', '108AD4BE-D5CA-4611-A020-1F643F594A87', '2015-01-27 00:00:00.000', 0)